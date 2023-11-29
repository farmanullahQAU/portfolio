import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:port/constants.dart';

class AppTheme {
  ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: false,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      
      displaySmall: GoogleFonts.openSans(color:Color(primaryColor),fontWeight: FontWeight.w500) ,
      titleLarge: GoogleFonts.poppins(color: Colors.white),
      titleSmall: GoogleFonts.openSans(color: Colors.white),
      bodySmall: GoogleFonts.openSans(color: Colors.white),

      

      
      
      
      ),

    navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: Color.fromARGB(255, 32, 31, 31),
        selectedLabelTextStyle: TextStyle(color: Colors.white),
        selectedIconTheme: IconThemeData(color: Colors.white, size: 30)),
    // cardColor: const Color(0xFF151B25),

    cardColor: const Color.fromARGB(255, 32, 31, 31),
  );
  ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: false,
    brightness: Brightness.light,
    textTheme: TextTheme(
      
      displaySmall: GoogleFonts.openSans(color: Colors.red,fontWeight: FontWeight.w500) ,
      titleLarge: GoogleFonts.openSans(color: Colors.black),
      titleSmall: GoogleFonts.openSans(color: Colors.black),
      bodySmall: GoogleFonts.openSans(color: Colors.black),


      
      
      
      ),
    navigationRailTheme: const NavigationRailThemeData(
        selectedLabelTextStyle: TextStyle(color: Colors.black),
        selectedIconTheme: IconThemeData(color: Colors.white, size: 30)),
  );
}
