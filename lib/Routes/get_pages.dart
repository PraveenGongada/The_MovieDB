import 'package:get/get.dart';
import 'package:the_movie_db/Screens/home_screen.dart';
import 'package:the_movie_db/Screens/movie_screen.dart';
import 'package:the_movie_db/Screens/seeall_screen.dart';

class GetPages {
  static List<GetPage> getpages = <GetPage>[
    GetPage(name: '/HomeScreen', page: () => const HomeScreen()),
    GetPage(name: '/MovieScreen', page: () => const MovieScreen()),
    GetPage(name: '/SeeAllScreen', page: () => const SeeAllScreen()),
  ];
}
