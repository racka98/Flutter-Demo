import 'package:flutter/material.dart';
import 'package:flutter_demo/state_management/provider_architecture/core/viewmodels/login_model.dart';
import 'package:flutter_demo/state_management/provider_architecture/locator.dart';
import 'package:flutter_demo/state_management/provider_architecture/ui/shared/app_colors.dart'
    as colors;
import 'package:flutter_demo/state_management/provider_architecture/ui/widgets/login_header.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _controller = TextEditingController();

  Future<void> _loginAttempt({
    required Future<bool> onLogin,
    required VoidCallback onNavigate,
  }) async {
    if (await onLogin) onNavigate();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => locator<LoginModel>(),
      child: Consumer<LoginModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              LoginHeader(controller: _controller),
              model.state == ViewState.Busy
                  ? const CircularProgressIndicator()
                  : TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        await _loginAttempt(
                          onLogin: model.login(_controller.text),
                          onNavigate: () {
                            Navigator.pushNamed(context, "/");
                          },
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
