import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/source/remote/api/error/http_request_exception.dart';
import '../../../generated/l10n.dart';
import '../resource/colors/app_colors.dart';
import '../../../utils/logic_utils.dart';
import '../../router/app_router.gr.dart';
import '../base/base_state.dart';
import '../custom_view/app_button.dart';
import '../custom_view/form_error_text.dart';
import '../custom_view/primary_input_layout.dart';
import '../custom_view/toolbar.dart';
import 'login_bloc.dart';

class LoginScreen extends StatefulWidget {
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
        AutoRouter.of(context).replace(const MainScreenRoute());
      }).disposeBy(disposeBag);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => bloc,
      child: Scaffold(
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
      ),
    );
  }

  Widget _errorText() {
    return ErrorText();
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
    
    return LoginButton();
  }

  @override
  void onServerError(HttpRequestException exception) {
    bloc.onServerError(exception);
  }
}

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool?>(
        stream: context.read<LoginBloc>().isButtonLoginEnable,
        builder: (context, snapshot) {
          return AppButton(
              isEnable: snapshot.data ?? false,
              text: S.of(context).login,
              enableGradient: AppColors.gradient,
              onPressed: context.read<LoginBloc>().submit);
        });
  }
}

class ErrorText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
        stream: context.read<LoginBloc>().error,
        builder: (context, snapshot) {
          return snapshot.data != null
              ? FormErrorText(error: snapshot.data!)
              : Container();
        });
  }
}
