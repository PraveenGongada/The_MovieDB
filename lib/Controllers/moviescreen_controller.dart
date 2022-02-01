import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MovieScreenController extends GetxController {
  final int id = Get.arguments[0];
  final String title = Get.arguments[1];
  final String poster = Get.arguments[2];
  final String votes = Get.arguments[3];
  final String rating = Get.arguments[4];
  final String genres = Get.arguments[5];
  final DateTime _releasedate = Get.arguments[6];
  final String overview = Get.arguments[7];
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  late String releaseDate;
  @override
  void onInit() {
    super.onInit();
    releaseDate = dateFormat.format(_releasedate);
  }
}
