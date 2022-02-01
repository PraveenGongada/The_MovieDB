import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/Controllers/seeall_controller.dart';
import 'package:the_movie_db/Widgets/horizontal_movie.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final control = Get.put(SeeAllController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Popular'),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              // HorizontalMovie(
              //   poster: poster,
              //   title: title,
              //   rating: rating,
              //   votes: votes,
              //   unformatrelease: unformatrelease,
              //   genres: genres,
              //   id: id,
              //   overview: overview,
              // ),
            );
          },
        ),
      ),
    );
  }
}
