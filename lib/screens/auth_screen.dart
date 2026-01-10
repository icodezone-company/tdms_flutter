import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../blocs/bloc/auth_bloc.dart';
import '../core/themes/app_sized.dart';
import '../core/utils/app_messages.dart';
import '../widgets/app_button.dart';
import '../widgets/auth_header.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController usernameController, passController;

  bool obscureText = true;

  @override
  void initState() {
    usernameController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تسجيل الدخول")),
      body: BlocProvider(
        create: (context) => GetIt.I<AuthBloc>(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.paddingLG),
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSizes.paddingMD),
                AuthHeader(),
                const SizedBox(height: AppSizes.paddingXL),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.trim().length < 3) {
                      return "يجب أنو يكون على الأقل 3 محارف";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'اسم المستخدم',
                    hintText: 'أدخل اسم المستخدم',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: AppSizes.paddingMD),
                TextFormField(
                  obscureText: obscureText,
                  textInputAction: TextInputAction.done,
                  controller: passController,
                  validator: (value) {
                    if (value == null || value.trim().length < 5) {
                      return "يجب أنو يكون مكون من 8 محارف فأكثر";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور',
                    hintText: 'أدخل كلمة المرور',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIconConstraints: BoxConstraints(maxWidth: 100),
                    suffixIcon: Padding(
                      padding: EdgeInsetsGeometry.only(left: 10),
                      child: IconButton(
                        onPressed: () => setState(() {
                          obscureText = !obscureText;
                        }),
                        icon: obscureText
                            ? Icon(Icons.visibility_outlined)
                            : Icon(Icons.visibility_off_outlined),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.paddingLG),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is LoginState && state.isSuccess) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                        (_) => false,
                      );
                      AppMessages.success(
                        context,
                        message: "تم تسجيل الدخول بنجاح",
                      );
                    }
                    if (state.isFailure) {
                      AppMessages.error(context, message: state.message!);
                    }
                  },
                  buildWhen: (previous, current) => current is LoginState,
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return AppButton(
                      title: 'دخول',
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          _autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                          return;
                        }
                        context.read<AuthBloc>().add(
                          LoginEvent(
                            username: usernameController.text.trim(),
                            pass: passController.text.trim(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
