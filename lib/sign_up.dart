import 'package:flutter/material.dart';
import 'package:store_app_ui/sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  height: 10,
                ),
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
                        hintText: 'Confirm Password',
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
                        return const SignInPage();
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
                          'Sign Up',
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
    );
  }
}
