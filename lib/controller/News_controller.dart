import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_getx_http/model/nes_moel.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 0.obs;

  Future<Articles> getData(String cat) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=ee894418d2a6454e935747cc4dc3f609");
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        print('====================');
        print('S_Code :  ' + response.statusCode.toString());
        print('====================');
        Articles data = Articles.fromJson(jsonDecode(response.body));
        print('====================');
        print(data.status);
        print('====================');
        return Articles.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
    return Articles();
  }
}
