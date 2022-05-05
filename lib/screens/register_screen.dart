import 'package:flutter/material.dart';

import '../widgets/custom_blue_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_labels.dart';
import '../widgets/custom_logo.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Logo(
                    title: "Register",
                  ),
                  const _Form(),
                  const Labels(
                      route: 'login',
                      text: "¿Ya tienes una cuenta?",
                      linkedText: "Ingresa en tu cuenta!"),
                  Text("Terminos y condiciones de uso",
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
              icon: Icons.person,
              placeHolder: 'Nombre',
              textController: nameCtrl,
              keyboardType: TextInputType.name),
          CustomInput(
              icon: Icons.mail_outline,
              placeHolder: 'Email',
              textController: emailCtrl,
              keyboardType: TextInputType.emailAddress),
          CustomInput(
              icon: Icons.lock_outline,
              placeHolder: 'Password',
              textController: passCtrl,
              isPassword: true,
              keyboardType: TextInputType.visiblePassword),
          CustomBlueButton(text: "Ingrese", onPressed: () {})
        ],
      ),
    );
  }
}
