import 'package:dio/dio.dart';
import 'package:news_app_with_global_api/core/config/dio_catch_error.dart';
import 'package:news_app_with_global_api/data/model/news_model.dart';

import '../../core/config/dio_config.dart';

class GetNewsService {
  static Future<dynamic> getNews({required String url}) async {
    try {
      Response response = await DioConfig.createRequest().get(url);
      if (response.statusCode == 200) {
        return NewsModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return DioCatchErrorConfig.catchError(e);
    }
  }
}
