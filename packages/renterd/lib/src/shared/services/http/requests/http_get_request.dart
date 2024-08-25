import 'package:dio/dio.dart';

import '../configs/dio_instance.dart';

class HttpGetRequest {
  static Future<Map<String, dynamic>> get({
    required String api,
    required Map<String, dynamic> headers,
  }) async {
    return await dio
        .get<String>(
          api,
          options: Options(
            headers: headers,
          ),
        )
        .then((response) => {
              "status": true,
              "response": response,
            })
        .onError<DioException>(
          (error, stackTrace) => {
            "status": false,
            "message": error,
          },
        );
  }
}
