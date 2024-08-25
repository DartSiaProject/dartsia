import 'package:dio/dio.dart';

import '../configs/dio_instance.dart';

class HttpUpdateRequest {
  static Future<Map<String, dynamic>> put({
    required String api,
    required Map<String, dynamic> headers,
    Object? content,
  }) async {
    return await dio
        .put<String>(
          api,
          data: content,
          options: Options(
            headers: headers,
          ),
        )
        .then((response) => {
              "status": true,
              "response": response,
            })
        .onError<DioException>((error, stackTrace) => {
              "status": false,
              "error": error,
            });
  }
}
