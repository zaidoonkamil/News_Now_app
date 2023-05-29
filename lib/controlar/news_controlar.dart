import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../model/news_model.dart';
import '../view/botom_nav_bar/sports.dart';

class NewsController {
  getData([String? cat])async{
    String co=value;
    final url=Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$co&category"
            "=$cat&apiKey=54d77d3fde5a48e9984f7c3222b606c6");
    http.Response response = await http.get(url);
    if(response.statusCode==200)
    {
      try{
        return Articles.fromJson(jsonDecode(response.body));
      }catch(e)
      {
        Get.snackbar("error", e.toString());
      }
    }
  }
}