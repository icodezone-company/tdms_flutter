import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/strings.dart';
import '../../models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Client _client;
  AuthBloc({required Client client}) : _client = client, super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(LoginState.loading());
        Response res = await _client.post(
          Uri.parse(Constants.login),
          headers: Constants.headers,
          body: jsonEncode({
            "user_name": event.username,
            "password": event.pass,
          }),
        );
        if (res.statusCode == 200) {
          final User user = User.fromJson(jsonDecode(res.body)["user"]);
          await GetIt.I<SharedPreferences>().setBool(Constants.loginKey, true);
          await GetIt.I<SharedPreferences>().setString(
            Constants.userKey,
            jsonEncode(user.toJson()),
          );
          emit(LoginState.success());
        } else if (res.statusCode == 400) {
          emit(LoginState.failure(message: jsonDecode(res.body)["message"]));
        } else {
          emit(
            LoginState.failure(
              message: Strings.unknownError(
                statusCode: res.statusCode,
                body: res.body,
              ),
            ),
          );
        }
      } catch (e) {
        print(e);
        emit(LoginState.failure(message: Strings.unexpectedError));
      }
    });
  }
}
