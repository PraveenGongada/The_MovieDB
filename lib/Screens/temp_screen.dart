import 'package:flutter/material.dart';
import 'package:the_movie_db/Constants/app_colors.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 55,
            width: 55,
            color: DarkModeColors.kcardcolor,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w185/xWOU0S7AqGEkyk8scLwwz66R2GO.jpg',
                    height: 55,
                    width: 55,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// https://image.tmdb.org/t/p/w185/xWOU0S7AqGEkyk8scLwwz66R2GO.jpg