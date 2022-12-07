import 'package:calculator/bloc/counter.dart';
import 'package:calculator/screens/home_screen.dart';
import 'package:calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              bodyColor: kSecondaryColor,
            ),
      ),
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider( 
        create: (_) => Counter(),
        child: const HomeScreen()),
    );
  }
}
