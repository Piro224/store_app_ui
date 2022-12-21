import 'package:flutter/material.dart';
import 'package:store_app_ui/market.dart';
import 'package:store_app_ui/sign_in.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[200],
        body: Column(
          children: [
            // Logo
            Padding(
              padding: const EdgeInsets.only(
                top: 70.0,
                right: 70,
                left: 70,
                bottom: 50,
              ),
              child: Image.asset('assets/images/banana.png'),
            ),

            //Some text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "We deliver groceries at your doorstep",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // And a Get Started button
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const SignInPage();
                  },
                ));
              },
              child: Container(
                width: 150,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
