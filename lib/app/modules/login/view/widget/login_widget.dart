import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/routes.dart';
import 'package:up_market_app/app/modules/add/view/widget/button.dart';
import 'package:up_market_app/app/modules/add/view/widget/textform.dart';
import 'package:up_market_app/app/modules/home/view/home_screen.dart';
import 'package:up_market_app/app/modules/login/view_model/login_notifier.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, val, _) {
        return Form(
          key: context.read<LoginNotifier>().loginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextformsField(
                controller: context.read<LoginNotifier>().userName,
                title: "Username",
                icon: Icons.person,
              ),
              TextformsField(
                controller: context.read<LoginNotifier>().password,
                title: "Password",
                obsecure: val.obsecure,
                icon1: IconButton(
                  icon: val.obsecure
                      ? const Iconify(Ic.twotone_remove_red_eye)
                      : const Iconify(Mdi.eye_off_outline),
                  onPressed: () {
                    context.read<LoginNotifier>().obSecureFn();
                  },
                ),
                icon: Icons.lock_outline,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ButtonWidget(
                  title: val.signUp ? "Sign Up" : 'Sign In',
                  function: () {
                    AppRoutes.removeScreenUntil(
                      screen: const HomeScreen(),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    val.signUp
                        ? "Already have an account"
                        : "New to our Platform?",
                  ),
                  TextButton(
                    onPressed: () {
                      val.signUp
                          ? context.read<LoginNotifier>().cardFunction(false)
                          : context.read<LoginNotifier>().cardFunction(true);
                    },
                    child: Text(
                      val.signUp ? "Sign In" : "Sign Up",
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
