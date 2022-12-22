// ignore_for_file: avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:store_app_ui/components/constants.dart';
import 'package:store_app_ui/components/form_error.dart';
import 'package:store_app_ui/sign_in/sign_in.dart';
import 'package:store_app_ui/sign_up/components/signup_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();

  get emailController => _emailController;
  get passController => _passwordController;
  get confirmPassController => _confirmPassController;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;

  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/images/banana.png',
                      height: 120,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Hello Again text
                  const Text(
                    'HELLO THERE!',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //welcome back text
                  const Text(
                    'Register below with your details!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //email textfield
                  buildEmail(),
                  const SizedBox(
                    height: 10,
                  ),
                  //Password textfield
                  buildPassword(),
                  const SizedBox(
                    height: 10,
                  ),
                  buildConfirmPassword(),
                  const SizedBox(
                    height: 5,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FormError(errors: errors),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  //signUp button
                  SignUpButton(formKey: _formKey),
                  const SizedBox(
                    height: 15,
                  ),

                  //Not a member/ resgister now text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a member? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignInPage();
                            },
                          ));
                        },
                        child: const Text(
                          'Sign In now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue,
        onChanged: (emailController) {
          if (emailController.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(emailController)) {
            removeError(error: kInvalidEmailError);
          }
          return null;
        },
        validator: (emailController) {
          if (emailController!.isEmpty) {
            addError(error: kEmailNullError);
            return "";
          } else if (!emailValidatorRegExp.hasMatch(emailController)) {
            addError(error: kInvalidEmailError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(14)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(14)),
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          hintText: 'Email',
          suffixIcon: const Icon(
            Icons.person_outline,
          ),
        ),
      ),
    );
  }

  Padding buildPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        onSaved: (newValue) => password = newValue,
        onChanged: (passwordController) {
          if (passwordController.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (passwordController.length >= 8) {
            removeError(error: kShortPassError);
          }
          password = passwordController;
        },
        validator: (passwordController) {
          if (passwordController!.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if (passwordController.length < 8) {
            addError(error: kShortPassError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(14)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(14)),
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          hintText: 'Password',
          suffixIcon: const Icon(
            Icons.lock_outline,
          ),
        ),
      ),
    );
  }

  Padding buildConfirmPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: _confirmPassController,
        obscureText: true,
        onSaved: (newValue) => confirmPassword = newValue,
        onChanged: (confirmPassController) {
          if (confirmPassController.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (confirmPassController.isNotEmpty &&
              password == confirmPassword) {
            removeError(error: kMatchPassError);
          }
          confirmPassword = confirmPassController;
        },
        validator: (confirmPassController) {
          if (confirmPassController!.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if (password != confirmPassController) {
            addError(error: kMatchPassError);
            return "";
          }
          password = confirmPassController;
          return null;
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(14)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(14)),
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          hintText: 'Confirm Password',
          suffixIcon: const Icon(
            Icons.lock_outline,
          ),
        ),
      ),
    );
  }
}
