import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/Routes/get_pages.dart';
import 'package:the_movie_db/Themes/themes.dart';

Future<void> main() async {
  runApp(
    ProviderScope(
      child: GetMaterialApp(
        title: 'The Movie DB',
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: 'HomeScreen',
        getPages: GetPages.getpages,
      ),
    ),
  );
}
