import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/Constants/app_sizes.dart';
import 'package:the_movie_db/Providers/providers.dart';
import 'package:the_movie_db/Widgets/now_playing.dart';
import 'package:the_movie_db/Widgets/slider_header.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:the_movie_db/Widgets/vertical_movie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final control = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: AppSizes.kdefaultpadding),
              //   child: const Text(
              //     'Search',
              //     style: TextStyle(
              //       fontSize: 19,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 20),
              // Padding(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: AppSizes.kdefaultpadding),
              //   child: SizedBox(
              //     height: 50,
              //     child: TextField(
              //       textAlignVertical: TextAlignVertical.center,
              //       decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8),
              //           borderSide: BorderSide.none,
              //         ),
              //         contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              //         suffixIcon: const Icon(Icons.search, color: Colors.white),
              //         hintText: 'Search Movies, TV shows, ....',
              //         fillColor: Colors.grey.shade900,
              //         filled: true,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 15),
              SliderHeader(
                title: 'Now Playing',
                ontap: () {
                  Get.toNamed('/SeeAllScreen');
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 280,
                child: Consumer(
                  builder: (context, ref, child) => ref
                      .watch(Providers.nowplayingprovider)
                      .when(
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, _) =>
                            Center(child: Text(error.toString())),
                        data: (data) => CarouselSlider(
                          options: CarouselOptions(
                            height: 280.0,
                            viewportFraction: 0.91,
                            autoPlay: false,
                            autoPlayInterval: 4.seconds,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: false,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                          ),
                          items: List.generate(
                            data.results.length,
                            (index) => Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 5 : 5, right: 5),
                              child: NowPlaying(
                                id: data.results[index].id,
                                title: data.results[index].title,
                                backdrop: data.results[index].backdropPath,
                                overview: data.results[index].overview,
                                poster: data.results[index].posterPath,
                                rating:
                                    data.results[index].voteAverage.toString(),
                                votes: data.results[index].voteCount,
                                genres: data.results[index].genreIds,
                                releaseDate: data.results[index].releaseDate,
                              ),
                            ),
                          ),
                        ),
                      ),
                ),
              ),
              const SizedBox(height: 25),
              SliderHeader(
                title: 'Popular',
                ontap: () {},
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: Consumer(
                  builder: (context, ref, child) => ref
                      .watch(Providers.popularprovider)
                      .when(
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (error, _) => Center(
                          child: Text(error.toString()),
                        ),
                        data: (data) => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.results.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 10 : 0, right: 10),
                              child: VerticalMovie(
                                id: data.results[index].id,
                                title: data.results[index].title,
                                poster: data.results[index].posterPath,
                                rating:
                                    data.results[index].voteAverage.toString(),
                                votes: data.results[index].voteCount,
                                releasedate: data.results[index].releaseDate,
                                genres: data.results[index].genreIds,
                                overview: data.results[index].overview,
                              ),
                            );
                          },
                        ),
                      ),
                ),
              ),
              const SizedBox(height: 25),
              SliderHeader(
                title: 'Upcoming',
                ontap: () {},
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: Consumer(
                  builder: (context, ref, child) => ref
                      .watch(Providers.getupcomingprovider)
                      .when(
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (error, _) => Center(
                          child: Text(error.toString()),
                        ),
                        data: (data) => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.results.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 10 : 0, right: 10),
                              child: VerticalMovie(
                                  id: data.results[index].id,
                                  title: data.results[index].title,
                                  poster: data.results[index].posterPath,
                                  rating: data.results[index].voteAverage
                                      .toString(),
                                  votes: data.results[index].voteCount,
                                  releasedate: data.results[index].releaseDate,
                                  genres: data.results[index].genreIds,
                                  overview: data.results[index].overview),
                            );
                          },
                        ),
                      ),
                ),
              ),
              const SizedBox(height: 25),
              SliderHeader(
                title: 'Top Rated',
                ontap: () {},
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: Consumer(
                  builder: (context, ref, child) => ref
                      .watch(Providers.topratedprovider)
                      .when(
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (error, _) => Center(
                          child: Text(error.toString()),
                        ),
                        data: (data) => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.results.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 10 : 0, right: 10),
                              child: VerticalMovie(
                                  id: data.results[index].id,
                                  title: data.results[index].title,
                                  poster: data.results[index].posterPath,
                                  rating: data.results[index].voteAverage
                                      .toString(),
                                  votes: data.results[index].voteCount,
                                  releasedate: data.results[index].releaseDate,
                                  genres: data.results[index].genreIds,
                                  overview: data.results[index].overview),
                            );
                          },
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
