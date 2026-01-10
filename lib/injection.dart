import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:network_info/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocs/bloc/auth_bloc.dart';

Future<void> init() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  GetIt.I.registerLazySingleton<SharedPreferences>(() => preferences);
  GetIt.I.registerLazySingleton<NetworkInfo>(() => NetworkInfo.instance);
  GetIt.I.registerLazySingleton<Client>(() => Client());

  // Blocs
  GetIt.I.registerFactory<AuthBloc>(() => AuthBloc(client: GetIt.I()));
}
