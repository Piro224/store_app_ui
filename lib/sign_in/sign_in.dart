// ignore_for_file: avoid_returning_null_for_void


import 'package:flutter/material.dart';
import 'package:store_app_ui/components/constants.dart';
import 'package:store_app_ui/components/form_error.dart';
import 'package:store_app_ui/sign_in/components/signIn_button.dart';
import 'package:store_app_ui/sign_up/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  get emailController => _emailController;
  get passController => _passwordController;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
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
                    height: 40,
                  ),
                  //Hello Again text
                  const Text(
                    'HELLO AGAIN!',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //welcome back text
                  const Text(
                    'Welcome back, you`ve been missed!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //email textfield
                  buildEmailField(),
                  const SizedBox(
                    height: 10,
                  ),
                  //Password textfield
                  buildPasswordField(),
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

                  //signin button
                  SignInButton(formKey: _formKey),
                  const SizedBox(
                    height: 15,
                  ),

                  //Not a member/ resgister now text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member yet? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignUpPage();
                            },
                          ));
                        },
                        child: const Text(
                          'Sign Up now',
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

  Padding buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
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
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        decoration: InputDecoration(
          // errorText: kEmailNullError,
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

  Padding buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        onSaved: (newValue) => password = newValue,
        onChanged: (passwordController) {
          if (passwordController.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (passwordController.length >= 8) {
            removeError(error: kShortPassError);
          }
          return null;
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
        keyboardType: TextInputType.emailAddress,
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          // errorText: kPassNullError,
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
}
