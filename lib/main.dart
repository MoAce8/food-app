import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/screens/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 132, 0, 51),
            brightness: Brightness.dark),
        textTheme: GoogleFonts.firaSansCondensedTextTheme(),
      ),
      home: const TabsScreen(),
    );
  }
}
