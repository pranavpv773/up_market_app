import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/modules/add/view/widget/button.dart';
import 'package:up_market_app/app/modules/add/view/widget/textform.dart';
import 'package:up_market_app/app/modules/login/view_model/login_notifier.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            obsecure: context.watch<LoginNotifier>().obsecure,
            icon1: IconButton(
              icon: context.watch<LoginNotifier>().obsecure
                  ? const Iconify(Ic.twotone_remove_red_eye)
                  : const Iconify(Mdi.eye_off_outline),
              onPressed: () {
                context.read<LoginNotifier>().obSecureFn();
              },
            ),
            icon: Icons.lock_outline,
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: ButtonWidget(
              title: 'Sign In',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("New to our Platform?"),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Sign Up",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
