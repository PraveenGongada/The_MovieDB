import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_db/Constants/app_colors.dart';
import 'package:the_movie_db/Constants/movie_genres.dart';
import 'package:the_movie_db/Controllers/moviescreen_controller.dart';

class VerticalMovie extends StatefulWidget {
  const VerticalMovie({
    Key? key,
    required this.poster,
    required this.title,
    required this.rating,
    required this.votes,
    required this.releasedate,
    required this.genres,
    required this.id,
    required this.overview,
  }) : super(key: key);

  final String? poster;
  final String? title;
  final String? rating;
  final String? overview;
  final int? votes;
  final DateTime? releasedate;
  final List<int>? genres;
  final int? id;

  @override
  State<VerticalMovie> createState() => _VerticalMovieState();
}

class _VerticalMovieState extends State<VerticalMovie> {
  String genre = '';
  String singlegenre = '';
  String votesinK = '';
  String posterurl = '';

  getgenre() {
    if (widget.genres != null) {
      for (int i = 0; i < widget.genres!.length; i++) {
        MovieGenres.genres.forEach((key, value) {
          if (widget.genres![i] == key) {
            genre = genre + value;
          }
        });
        genre = genre + (i == widget.genres!.length - 1 ? '' : ', ');
      }
    } else {
      genre = 'No Genre';
      singlegenre = 'No Genre';
    }
  }

  getsinglegenre() {
    singlegenre = genre.split(', ')[0];
  }

  @override
  void initState() {
    super.initState();
    posterurl = widget.poster != null
        ? ('https://image.tmdb.org/t/p/w780' + widget.poster!)
        : 'https://res.cloudinary.com/people-matters/image/upload/q_auto,f_auto/v1517845732/1517845731.jpg';
    votesinK = NumberFormat.compact().format(widget.votes ?? 0);
    getgenre();
    getsinglegenre();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Get.isRegistered<MovieScreenController>()) {
          Get.delete<MovieScreenController>();
        }
        Get.toNamed(
          '/MovieScreen',
          arguments: [
            widget.id,
            widget.title,
            posterurl,
            votesinK,
            widget.rating,
            genre,
            widget.releasedate,
            widget.overview,
          ],
          preventDuplicates: false,
        );
      },
      child: Container(
        height: 300,
        width: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0XFF171717),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                // placeholder: (context, url) =>
                //     const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Text('Error loading image'),
                imageUrl: posterurl,
                height: 215,
                width: 145,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title ?? 'Title Here',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${widget.releasedate != null ? widget.releasedate!.year : 1947} • $singlegenre',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: DarkModeColors.ksecondarytextColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Colors.yellowAccent,
                        size: 18,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${(widget.rating)?.substring(0, 3) ?? 0}  ($votesinK)',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: DarkModeColors.ksecondarytextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
