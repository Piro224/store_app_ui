import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:store_app_ui/home.dart';
import 'package:store_app_ui/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Product(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App UI',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          iconTheme: const IconThemeData(color: Colors.white),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const Home(),
      ),
    );
  }
}
