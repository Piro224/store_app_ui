// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final color;
  final String itemName;
  final String itemPrice;
  final String imagePath;
  void Function()? onPressed;

  ProductCard({
    super.key,
    this.color,
    required this.itemPrice,
    required this.imagePath,
    required this.itemName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const Spacer(),

            //The Image
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                imagePath,
                height: 80,
              ),
            ),
            const Spacer(),
            //The ItemName
            Text(
              itemName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),

            //The ItemPrice and wrap with gesture detector

            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: onPressed,
                  child: Text(
                    "\$$itemPrice",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
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
