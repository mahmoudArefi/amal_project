import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled5/common/image_variables.dart';
import 'package:untitled5/common/widgets/a_text.dart';
import 'package:untitled5/public_files/const.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const LoginScreenLogo(),
            SignButton(
                label: 'Sign Up',
                function: () {
                  print('hi it\'s work');
                })
          ],
        ),
      ),
    );
  }
}

class LoginScreenLogo extends StatelessWidget {
  const LoginScreenLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.24,
      width: Get.width,
      child: Center(child: Image.asset(MyImage.logo)),
    );
  }
}

class ATextField extends StatelessWidget {
  const ATextField(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
    );
  }
}

class SignButton extends StatelessWidget {
  const SignButton({required this.label, required this.function, super.key});

  final String label;

  final Function function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.85,
      height: Get.height * 0.075,
      child: InkWell(
        onTap: () => function(),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: purple,
          ),
          child: Center(
            child: AText(
              label,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class SignScreenFooter extends StatelessWidget {
  const SignScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AText('Already a member? '),

      ],
    );
  }
}

class SignScreenController {
  RxBool isLoginMode = true.obs;
}
