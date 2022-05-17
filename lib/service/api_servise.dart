import 'package:dio/dio.dart';

class ApiServise {
  static String catgory = 'dasturlashes';
  static Future getNews() async {
    Response res = await Dio().get(
      'http://localhost:1337/api/$catgory?populate=*',
    );
    return res.data['data'];
  }
}