import 'package:flutter/material.dart';
import 'package:the_movie_db/Constants/app_colors.dart';

class Themes {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: DarkModeColors.kscaffoldcolor,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: DarkModeColors.kprimarycolor,
        ),
  );
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: LightModeColors.kscaffoldcolor,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: LightModeColors.kprimarycolor,
        ),
  );
}
