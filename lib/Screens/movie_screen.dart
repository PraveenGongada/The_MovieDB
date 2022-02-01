import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/Constants/app_colors.dart';
import 'package:the_movie_db/Constants/app_sizes.dart';
import 'package:the_movie_db/Controllers/moviescreen_controller.dart';
import 'package:the_movie_db/Providers/providers.dart';
import 'package:the_movie_db/Widgets/cast_widget.dart';
import 'package:the_movie_db/Widgets/reviews_widget.dart';
import 'package:the_movie_db/Widgets/slider_header.dart';
import 'package:the_movie_db/Widgets/vertical_movie.dart';
import 'package:the_movie_db/Widgets/videos_widget.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final control = Get.put(MovieScreenController());
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                imageUrl: control.poster,
                height: MediaQuery.of(context).size.height * 0.70,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.kdefaultpadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      control.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                          '${control.rating}  (${control.votes} reviews)',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: DarkModeColors.ksecondarytextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      control.genres,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: DarkModeColors.ksecondarytextColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      control.releaseDate,
                      style: TextStyle(
                        fontSize: 14,
                        color: DarkModeColors.ksecondarytextColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Plot',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      control.overview,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: DarkModeColors.ksecondarytextColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Videos',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 150,
                      child: Consumer(
                        builder: (context, ref, child) => ref
                            .watch(Providers.getvideosprovider(control.id))
                            .when(
                              loading: () => const Center(
                                  child: CircularProgressIndicator()),
                              error: (error, _) =>
                                  Center(child: Text(error.toString())),
                              data: (data) {
                                return data.results.isNotEmpty
                                    ? ListView.builder(
                                        itemCount: data.results.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                left: index == 0 ? 0 : 10),
                                            child: VideosWidget(
                                                videourl:
                                                    data.results[index].key),
                                          );
                                        },
                                      )
                                    : const Center(
                                        child: Text('No Videos available'),
                                      );
                              },
                            ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Cast',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 85,
                      child: Consumer(
                        builder: (context, ref, child) => ref
                            .watch(Providers.getcastprovider(control.id))
                            .when(
                              loading: () => const Center(
                                  child: CircularProgressIndicator()),
                              error: (error, _) =>
                                  Center(child: Text(error.toString())),
                              data: (data) => ListView.builder(
                                itemCount: data.cast.length > 25
                                    ? 25
                                    : data.cast.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: index == 0 ? 0 : 10),
                                    child: CastWidget(
                                        casturl: data.cast[index].profilePath,
                                        character: data.cast[index].character ??
                                            'null',
                                        name: data.cast[index].name ?? 'null'),
                                  );
                                },
                              ),
                            ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Consumer(
                      builder: (context, ref, child) => ref
                          .watch(Providers.getreviewsprovider(control.id))
                          .when(
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                            error: (error, stackTrace) =>
                                Center(child: Text(error.toString())),
                            data: (data) {
                              return data.results.isEmpty
                                  ? Column(
                                      children: const [
                                        Text(
                                          'Reviews',
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text('No Reviews'),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        SliderHeader(
                                          hpadding: 0.0,
                                          title: 'Reviews',
                                          ontap: () {
                                            showBottomSheet(
                                              context: context,
                                              builder: (context) => Scaffold(
                                                appBar: AppBar(
                                                  title: const Text('Reviews'),
                                                  titleSpacing: 0,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 0,
                                                ),
                                                body: Container(
                                                  color: Colors.black,
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: AppSizes
                                                            .kdefaultpadding),
                                                    itemCount:
                                                        data.totalResults,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            ReviewsWidget(
                                                      imageurl: data
                                                          .results[index]
                                                          .authorDetails
                                                          .avatarPath,
                                                      rating: data
                                                          .results[index]
                                                          .authorDetails
                                                          .rating,
                                                      name: data.results[index]
                                                          .author,
                                                      review: data
                                                          .results[index]
                                                          .content,
                                                      maxlines: 100,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 15),
                                        ReviewsWidget(
                                          imageurl: data.results[0]
                                              .authorDetails.avatarPath,
                                          rating: data
                                              .results[0].authorDetails.rating,
                                          name: data.results[0].author,
                                          review: data.results[0].content,
                                          maxlines: 5,
                                        ),
                                      ],
                                    );
                            },
                          ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Similar',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 300,
                      child: Consumer(
                        builder: (context, ref, child) => ref
                            .watch(Providers.getsimilarprovider(control.id))
                            .when(
                                loading: () => const Center(
                                    child: CircularProgressIndicator()),
                                error: (error, stackTrace) =>
                                    Center(child: Text(error.toString())),
                                data: (data) {
                                  if (data.results.isEmpty) {
                                    return const Center(
                                        child: Text('No Similar Movies'));
                                  } else {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: data.results.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: index == 0 ? 0 : 10),
                                          child: VerticalMovie(
                                            id: data.results[index].id,
                                            title: data.results[index].title,
                                            poster:
                                                data.results[index].posterPath,
                                            rating: data
                                                .results[index].voteAverage
                                                .toString(),
                                            votes:
                                                data.results[index].voteCount,
                                            releasedate:
                                                data.results[index].releaseDate,
                                            genres:
                                                data.results[index].genreIds,
                                            overview:
                                                data.results[index].overview,
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Recommendations',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 300,
                      child: Consumer(
                        builder: (context, ref, child) => ref
                            .watch(Providers.getrecommendationsprovider(
                                control.id))
                            .when(
                                loading: () => const Center(
                                    child: CircularProgressIndicator()),
                                error: (error, stackTrace) =>
                                    Center(child: Text(error.toString())),
                                data: (data) {
                                  if (data.results.isEmpty) {
                                    return const Center(
                                        child: Text('No Recommendations'));
                                  } else {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: data.results.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: index == 0 ? 0 : 10),
                                          child: VerticalMovie(
                                            id: data.results[index].id,
                                            title: data.results[index].title,
                                            poster:
                                                data.results[index].posterPath,
                                            rating: data
                                                .results[index].voteAverage
                                                .toString(),
                                            votes:
                                                data.results[index].voteCount,
                                            releasedate:
                                                data.results[index].releaseDate,
                                            genres:
                                                data.results[index].genreIds,
                                            overview:
                                                data.results[index].overview,
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
