// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
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
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool btntapped = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Spacer(),

            //The Image
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                widget.imagePath,
                height: 80,
              ),
            ),
            const Spacer(),
            //The ItemName
            Text(
              widget.itemName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),

            //The ItemPrice and wrap with gesture detector

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: widget.onPressed,
                      child: Text(
                        "\$${widget.itemPrice}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    color: btntapped ? Colors.amber : Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      widget.onPressed;
                      setState(() {
                        btntapped = !btntapped;
                      });
                    },
                    icon: btntapped
                        ? const Icon(
                            Icons.add,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                  ),
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
