import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_login_register/constants.dart';
import 'package:ui_login_register/views/screens/register_screen.dart';
import 'package:ui_login_register/views/widgets/input_password_widget.dart';
import 'package:ui_login_register/views/widgets/input_widget.dart';
import 'package:ui_login_register/views/widgets/text_title_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final bool _isVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      children: [
                        const Gap(10),
                        const TextTitleWidget(text: "LOGIN"),
                        const Gap(20),
                        InputWidget(
                          placeholder: "Email Adress",
                          controller: _emailController,
                          error_validate: 'Veuillez saisir email',
                          icon: Icons.email_outlined,
                        ),
                        const Gap(20),
                        InputPasswordWidget(
                          controller: _passwordController,
                          error_validate: 'Veuillez saisir un mot de passe',
                        ),
                        const Gap(10),
                        InkWell(
                          onTap: () {
                            // code pour  la fonction du mot de passe oublier
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forget Password ?",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),
                        const Gap(40),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Constants.button_color),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Changer le rayon ici
                              ),
                            ),
                          ),
                          onPressed: () {
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen());
                            if (_formKey.currentState?.validate() ?? false) {
                              // code pour le login
                            }
                          },
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'TitleFontFamily',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Create an a Count ?",
                              style: TextStyle(color: Colors.black54),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()));
                              },
                              child: const Text(
                                "Create a compte",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const Gap(25),
                      ],
                    ),
                  ),
                ))));
  }
}
