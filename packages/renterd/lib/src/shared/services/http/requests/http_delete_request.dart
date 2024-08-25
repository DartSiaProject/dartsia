import 'package:dio/dio.dart';

import '../configs/dio_instance.dart';

class HttpDeleteRequest {
  static Future<Map<String, dynamic>> delete({
    required String api,
    required Map<String, dynamic> headers,
  }) async {
    return await dio
        .delete<String>(
          api,
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
