import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_db/Models/cast_model.dart';
import 'package:the_movie_db/Models/recommendations_model.dart';
import 'package:the_movie_db/Models/reviews_model.dart';
import 'package:the_movie_db/Models/similar_model.dart';
import 'package:the_movie_db/Models/videos_model.dart';
import 'package:the_movie_db/Services/themovie_db.dart';

abstract class Providers {
  static final nowplayingprovider =
      FutureProvider((ref) => TheMovieDB.getnowplaying());

  static final popularprovider =
      FutureProvider((ref) => TheMovieDB.getpopular());

  static final topratedprovider =
      FutureProvider((ref) => TheMovieDB.getToprated());

  static final getupcomingprovider =
      FutureProvider((ref) => TheMovieDB.getupcoming());

  static final getsimilarprovider = FutureProvider.family<SimilarModel, int>(
      (ref, id) => TheMovieDB.getsimilar(id));

  static final getrecommendationsprovider =
      FutureProvider.family<RecommendationsModel, int>(
          (ref, id) => TheMovieDB.getrecommendations(id));

  static final getvideosprovider = FutureProvider.family<VideosModel, int>(
      (ref, id) => TheMovieDB.getvideos(id));

  static final getcastprovider = FutureProvider.family<CastModel, int>(
      (ref, id) => TheMovieDB.getcast(id));

  static final getreviewsprovider = FutureProvider.family<ReviewsModel, int>(
      (ref, id) => TheMovieDB.getreviews(id));
}
