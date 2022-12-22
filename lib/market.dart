import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_ui/components/cart_page.dart';
import 'package:store_app_ui/components/product.dart';
import 'package:store_app_ui/components/product_card.dart';

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[200],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            //Material route to cart page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CartPage();
                },
              ),
            );
          },
          child: const Icon(
            Icons.shopping_bag,
            color: Colors.black,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //some text
            const SizedBox(
              height: 30,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Good morning !!",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Our Featured Products",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //gridview with add to cart button
            Expanded(
              child: Consumer<Product>(
                builder: (context, value, child) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: GridView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: value.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1 / 1.2, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            color: value.products[index][0],
                            itemName: value.products[index][1],
                            itemPrice: value.products[index][2],
                            imagePath: value.products[index][3],
                            onPressed: () {
                              value.addItems(index);
                              // Provider.of<Product>(context, listen: false)
                              //     .addItems(index);
                            },
                          );
                        }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
