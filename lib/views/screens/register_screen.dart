import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_login_register/constants.dart';
import 'package:ui_login_register/views/screens/login_screen.dart';
import 'package:ui_login_register/views/widgets/input_password_widget.dart';
import 'package:ui_login_register/views/widgets/input_widget.dart';
import 'package:ui_login_register/views/widgets/text_title_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final bool _isVisible = false;
  String _selectedGender = 'Sexe';
  DateTime? _selectedDate;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

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
                      const TextTitleWidget(text: "CREATE ACCOUNT"),
                      const Gap(20),
                      InputWidget(
                        placeholder: "Email Adress",
                        controller: _emailController,
                        error_validate: 'Veuillez saisir email',
                        icon: Icons.email_outlined,
                      ),
                      const Gap(20),
                      InputWidget(
                        placeholder: "Name",
                        controller: _nameController,
                        error_validate: 'Veuillez saisir le nom',
                        icon: Icons.person_rounded,
                      ),
                      const Gap(20),
                      InputWidget(
                        placeholder: "Last Name",
                        controller: _lastNameController,
                        error_validate: 'Veuillez saisir le prenom',
                        icon: Icons.person_rounded,
                      ),
                      const Gap(20),
                      InputWidget(
                        placeholder: "Telephone",
                        controller: _nameController,
                        error_validate:
                            'Veuillez saisir le numero de telephone',
                        icon: Icons.phone,
                      ),
                      const Gap(20),
                      DropdownButtonFormField<String>(
                        value: _selectedGender,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedGender = value ?? '';
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Sexe',
                          prefixIcon: const Icon(Icons.category),
                          fillColor: Constants.input_color,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items: ['Sexe', 'Homme', 'Femme'].map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez choisir votre sexe';
                          }
                          return null;
                        },
                      ),
                      const Gap(20),
                      TextFormField(
                        readOnly: true,
                        controller: TextEditingController(
                          text: _selectedDate != null
                              ? "${_selectedDate!.toLocal()}".split(' ')[0]
                              : '',
                        ),
                        decoration: InputDecoration(
                          labelText: 'Select a date',
                          fillColor: Constants.input_color,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () {
                              _selectDate(context);
                            },
                          ),
                        ),
                      ),
                      const Gap(20),
                      InputPasswordWidget(
                        controller: _nameController,
                        error_validate: 'Veuillez saisir un mot de passe',
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
                          if (_formKey.currentState?.validate() ?? false) {
                            // code pour le login
                          }
                        },
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Create Account",
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
                            "Already have a count ?",
                            style: TextStyle(color: Colors.black54),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: const Text(
                              "Sign In",
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
              ))),
    );
  }
}
