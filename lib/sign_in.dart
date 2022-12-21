import 'package:flutter/material.dart';
import 'package:store_app_ui/market.dart';
import 'package:store_app_ui/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
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
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
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
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
          
                //signin button
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const Market();
                      },
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
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
    );
  }
}
