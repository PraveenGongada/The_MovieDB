import 'package:flutter/material.dart';
import 'package:the_movie_db/Constants/app_colors.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({
    Key? key,
    required this.imageurl,
    required this.rating,
    required this.name,
    required this.review,
    required this.maxlines,
  }) : super(key: key);
  final String? imageurl;
  final double? rating;
  final String? name;
  final String? review;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                height: 25,
                width: 25,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              name ?? 'No Name',
              style: TextStyle(
                fontSize: 16,
                color: DarkModeColors.ksecondarytextColor,
              ),
            ),
            const Spacer(),
            Container(
              height: 20,
              width: 50,
              decoration: BoxDecoration(
                color: DarkModeColors.kcardcolor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.yellowAccent,
                    size: 18,
                  ),
                  Text(
                    '${rating ?? 0}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: DarkModeColors.ksecondarytextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          review ?? 'No Review',
          maxLines: maxlines,
          overflow: TextOverflow.ellipsis,
        ),
        const Divider(),
      ],
    );
  }
}
