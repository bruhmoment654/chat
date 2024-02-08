import 'package:chat/themes/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final robotoFont = GoogleFonts.inter().fontFamily;

final ThemeData lightMode = ThemeData(colorScheme: lightColorScheme, fontFamily: robotoFont);
final ThemeData darkMode = ThemeData(colorScheme: darkColorScheme, fontFamily: robotoFont);