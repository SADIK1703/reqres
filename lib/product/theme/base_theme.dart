import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseTheme {
  ThemeData theme(context) => ThemeData(
        primaryColor: const Color(0xFF6200EE),
        colorScheme: const ColorScheme.dark(primary: Color(0xFF03DAC6)),
        scaffoldBackgroundColor: Colors.black54,
        appBarTheme: const AppBarTheme(
          color: Color(0xFF6200EE),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: const Color(0xFF03DAC6),
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ).copyWith(
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.grey),
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.grey),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.grey),
        ),
      );
}
