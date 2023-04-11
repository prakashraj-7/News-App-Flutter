import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/newsmodel.dart';

class Newsapi {
 
  Future<List<Article>> getdata(String country) async {
    Response res = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$country&apiKey=7bd0708c70244ceba5b64b44b61bf34d'));

    if (res.statusCode == 200) {
      List r = jsonDecode(res.body)['articles'];
    
      return r.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}



final apiProvider = Provider<Newsapi>((ref) => Newsapi());

