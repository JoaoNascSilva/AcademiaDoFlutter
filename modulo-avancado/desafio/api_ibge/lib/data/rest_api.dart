import 'package:dio/dio.dart';

class RestAPI {
  final String url;
  final Dio dio = Dio();

  RestAPI(this.url);

  Future<Response> get() async {
    Response response =
        await dio.get(url, options: Options(responseType: ResponseType.json));

    if (response.statusCode == 200) {
      return response;
    }

    return null;
  }

  Future<Response> post() async {
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      return response;
    }

    return null;
  }
}
