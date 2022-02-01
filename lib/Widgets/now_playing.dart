import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_db/Constants/app_colors.dart';
import 'package:the_movie_db/Constants/movie_genres.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying(
      {Key? key,
      required this.backdrop,
      required this.title,
      required this.rating,
      required this.votes,
      required this.genres,
      required this.poster,
      required this.id,
      required this.overview,
      required this.releaseDate})
      : super(key: key);

  final String? backdrop;
  final String? poster;
  final String? title;
  final String? rating;
  final String? overview;
  final DateTime? releaseDate;
  final int? votes;
  final int? id;
  final List<int>? genres;

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  String genre = '';
  String votesinK = '';
  String posterurl = '';
  getgenre() {
    for (int i = 0; i < widget.genres!.length; i++) {
      MovieGenres.genres.forEach((key, value) {
        if (widget.genres![i] == key) {
          genre = genre + value;
        }
      });
      genre = genre + (i == widget.genres!.length - 1 ? '' : ', ');
    }
  }

  @override
  void initState() {
    votesinK = NumberFormat.compact().format(widget.votes ?? 0);
    posterurl = widget.poster != null
        ? ('https://image.tmdb.org/t/p/w780' + widget.poster!)
        : 'https://silicophilic.com/wp-content/uploads/2021/01/Vac_System_Error.png';
    votesinK = NumberFormat.compact().format(widget.votes ?? 0);
    getgenre();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/MovieScreen', arguments: [
        widget.id,
        widget.title,
        posterurl,
        votesinK,
        widget.rating,
        genre,
        widget.releaseDate,
        widget.overview,
      ]),
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              widget.backdrop != null
                  ? ('https://image.tmdb.org/t/p/w780' + widget.backdrop!)
                  : 'https://media.istockphoto.com/photos/warning-concept-yellow-exclamation-point-glowing-amid-black-points-picture-id1305170062?b=1&k=20&m=1305170062&s=170667a&w=0&h=q6mAXN4dsnulYh2jMaTkVPacNVKU_vr7Sz_JhnXguyQ=',
              maxHeight: 200,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(color: Colors.black.withOpacity(0.7)),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          widget.backdrop != null
                              ? ('https://image.tmdb.org/t/p/w500' +
                                  widget.backdrop!)
                              : 'https://media.istockphoto.com/photos/warning-concept-yellow-exclamation-point-glowing-amid-black-points-picture-id1305170062?b=1&k=20&m=1305170062&s=170667a&w=0&h=q6mAXN4dsnulYh2jMaTkVPacNVKU_vr7Sz_JhnXguyQ=',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.title ?? 'Title Here',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
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
                      const SizedBox(width: 5),
                      Text(
                        '${widget.rating ?? 0}  ($votesinK)',
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
