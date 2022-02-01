import 'dart:convert';

import 'package:the_movie_db/Keys/keys.dart';
import 'package:the_movie_db/Models/cast_model.dart';
import 'package:the_movie_db/Models/nowandupcoming_model.dart';
import 'package:http/http.dart' as http;
import 'package:the_movie_db/Models/movie_model.dart';
import 'package:the_movie_db/Models/recommendations_model.dart';
import 'package:the_movie_db/Models/reviews_model.dart';
import 'package:the_movie_db/Models/similar_model.dart';
import 'package:the_movie_db/Models/videos_model.dart';

class TheMovieDB {
  static Future<NowandUpcomingModel> getnowplaying() async {
    const String url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=${Keys.tmdb_key}&language=en-US&region=US&page=1';
    final response = await http.get(Uri.parse(url));

    final data = nowandupcomingFromJson(response.body);

    return data;
  }

  static Future<MovieModel> getpopular() async {
    const String url =
        'https://api.themoviedb.org/3/movie/popular?api_key=${Keys.tmdb_key}&language=en-US&region=US&page=1';
    final response = await http.get(Uri.parse(url));

    final data = popularModelFromJson(response.body);

    return data;
  }

  static Future<MovieModel> getToprated() async {
    const String url =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=${Keys.tmdb_key}&language=en-US&page=1';
    final response = await http.get(Uri.parse(url));

    final data = popularModelFromJson(response.body);

    return data;
  }

  static Future<NowandUpcomingModel> getupcoming() async {
    const String url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=${Keys.tmdb_key}&language=en-US&region=US&page=1';
    final response = await http.get(Uri.parse(url));

    final data = nowandupcomingFromJson(response.body);

    return data;
  }

  static Future<SimilarModel> getsimilar(int movieid) async {
    String url =
        'http://api.themoviedb.org/3/movie/$movieid/similar?api_key=${Keys.tmdb_key}&language=en-US&page=1';

    final response = await http.get(Uri.parse(url));

    final data = similarModelFromJson(response.body);

    return data;
  }

  static Future<RecommendationsModel> getrecommendations(int movieid) async {
    String url =
        'http://api.themoviedb.org/3/movie/$movieid/recommendations?api_key=${Keys.tmdb_key}&language=en-US&page=1';

    final response = await http.get(Uri.parse(url));

    final data = recommendationsModelFromJson(response.body);

    return data;
  }

  static Future<VideosModel> getvideos(int movieid) async {
    String url =
        'https://api.themoviedb.org/3/movie/$movieid/videos?api_key=${Keys.tmdb_key}&language=en-US';
    final response = await http.get(Uri.parse(url));

    final data = videosModelFromJson(response.body);

    return data;
  }

  static Future<CastModel> getcast(int movieid) async {
    String url =
        'https://api.themoviedb.org/3/movie/$movieid/credits?api_key=${Keys.tmdb_key}&language=en-US';
    final response = await http.get(Uri.parse(url));

    Map<String, dynamic> json = jsonDecode(response.body);

    final data = CastModel.fromJson(json);
    return data;
  }

  static Future<ReviewsModel> getreviews(int movieid) async {
    String url =
        'https://api.themoviedb.org/3/movie/$movieid/reviews?api_key=${Keys.tmdb_key}&language=en-US&page=1';
    final response = await http.get(Uri.parse(url));

    final data = reviewsModelFromJson(response.body);

    return data;
  }
}
