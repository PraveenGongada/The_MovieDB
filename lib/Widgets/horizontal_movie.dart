import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_db/Constants/app_colors.dart';
import 'package:the_movie_db/Constants/app_sizes.dart';
import 'package:the_movie_db/Constants/movie_genres.dart';

class HorizontalMovie extends StatefulWidget {
  const HorizontalMovie({
    Key? key,
    required this.poster,
    required this.title,
    required this.rating,
    required this.votes,
    required this.unformatrelease,
    required this.genres,
    required this.id,
    required this.overview,
  }) : super(key: key);

  final String? poster;
  final String? title;
  final String? rating;
  final String? overview;
  final int? votes;
  final DateTime? unformatrelease;
  final List<int>? genres;
  final int? id;

  @override
  State<HorizontalMovie> createState() => _HorizontalMovieState();
}

class _HorizontalMovieState extends State<HorizontalMovie> {
  String genre = '';
  String singlegenre = '';
  String votesinK = '';
  String posterurl = '';
  late String releasedate;

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

  formatdate() {
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    releasedate = dateFormat.format(widget.unformatrelease ?? DateTime.now());
  }

  @override
  void initState() {
    super.initState();
    posterurl = widget.poster != null
        ? ('https://image.tmdb.org/t/p/w780' + widget.poster!)
        : 'https://res.cloudinary.com/people-matters/image/upload/q_auto,f_auto/v1517845732/1517845731.jpg';
    votesinK = NumberFormat.compact().format(widget.votes ?? 0);
    getgenre();
    formatdate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.kdefaultpadding),
      height: 235,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: DarkModeColors.kcardcolor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: posterurl,
              height: 215,
              width: MediaQuery.of(context).size.width * 0.35,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                widget.title ?? 'No Title',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                releasedate,
                style: TextStyle(
                  fontSize: 14,
                  color: DarkModeColors.ksecondarytextColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                genre,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: DarkModeColors.ksecondarytextColor,
                ),
              ),
              const SizedBox(height: 5),
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
                    '${widget.rating}   ($votesinK reviews)',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: DarkModeColors.ksecondarytextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.525,
                child: Text(
                  widget.overview ?? 'No Overview',
                  textAlign: TextAlign.start,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: DarkModeColors.ksecondarytextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
