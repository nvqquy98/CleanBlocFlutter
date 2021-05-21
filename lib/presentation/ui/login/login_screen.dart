import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../data/source/remote/api/error/http_request_exception.dart';
import '../../../generated/l10n.dart';
import '../../../utils/app_color.dart';
import '../../../utils/utils.dart';
import '../../router/app_router.gr.dart';
import '../base/base_screen.dart';
import '../custom_view/app_button.dart';
import '../custom_view/form_error_text.dart';
import '../custom_view/primary_input_layout.dart';
import '../custom_view/toolbar.dart';
import 'login_bloc.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen();

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends BaseState<LoginScreen, LoginBloc> {
  @override
  void initState() {
    super.initState();
    bloc
      ..loginSuccess.listen((_) {
        AutoRouter.of(context).replace(HomeScreenRoute(isFromLogin: true));
      }).disposeBy(disposeBag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: S.of(context).login),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _errorText(),
                const SizedBox(
                  height: 20,
                ),
                _emailInputLayout(),
                const SizedBox(
                  height: 16,
                ),
                _passwordInputLayout(),
                const SizedBox(
                  height: 30,
                ),
                _loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorText() {
    return StreamBuilder<String?>(
        stream: bloc.error,
        builder: (context, snapshot) {
          return snapshot.data != null
              ? FormErrorText(error: snapshot.data!)
              : Container();
        });
  }

  PrimaryInputLayout _emailInputLayout() {
    return PrimaryInputLayout(
      title: S.of(context).email,
      inputType: TextInputType.emailAddress,
      maxLength: 255,
      onTextChanged: bloc.emailChanged,
    );
  }

  PrimaryInputLayout _passwordInputLayout() {
    return PrimaryInputLayout(
        title: S.of(context).password,
        inputType: TextInputType.visiblePassword,
        maxLength: 255,
        onTextChanged: bloc.passwordChanged);
  }

  Widget _loginButton() {
    return StreamBuilder<bool?>(
        stream: bloc.isButtonLoginEnable,
        builder: (context, snapshot) {
          return AppButton(
              isEnable: snapshot.data ?? false,
              text: S.of(context).login,
              enableGradient: AppColors.gradient,
              onPressed: bloc.submit);
        });
  }

  @override
  void onServerError(HttpRequestException exception) {
    bloc.onServerError(exception);
  }
}
