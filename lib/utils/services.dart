import 'package:dio/dio.dart';

class Services {

  static Future<dynamic> get(String base, String desired ,String startDate, String endDate) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      String url = "https://api.exchangerate.host/timeseries?start_date=$startDate&end_date=$endDate&base=$base&symbols=$desired";
      print("url : $url");
      return await Dio().get(
        url,
        options: Options(headers: headers),
      );
    } on DioError catch (e) {
      return e.message!;
    }
  }
}