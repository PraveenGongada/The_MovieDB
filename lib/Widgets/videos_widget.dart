import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/Constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class VideosWidget extends StatelessWidget {
  const VideosWidget({Key? key, required this.videourl}) : super(key: key);

  final String videourl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch('https://www.youtube.com/watch?v=$videourl')) {
          await launch('https://www.youtube.com/watch?v=$videourl');
        } else {
          const GetSnackBar(
            title: "Can't launch url",
          );
        }
      },
      child: SizedBox(
        height: 210,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 210,
              color: DarkModeColors.kcardcolor,
              child: Image.network(
                'https://i.ytimg.com/vi/$videourl/hqdefault.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Text('Unavailable'),
              ),
            ),
            Center(child: Image.asset('assets/icons/youtube.png', height: 40)),
          ],
        ),
      ),
    );
  }
}
