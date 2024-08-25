import 'package:dio/dio.dart';

import '../configs/dio_instance.dart';

class HttpPostRequest {
  static Future<Map<String, dynamic>> post({
    required String api,
    required Map<String, dynamic> headers,
    Object? content,
  }) async {
    return await dio
        .post<String>(
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

//   static Future<Response<String>> postFile({
//     required String api,
//     required FormData content,
//     required Map<String, String> headers,
//   }) async {
//     var _response = await dio.post<String>(
//       api,
//       data: content,
//       options: Options(
//         headers: headers,
//       ),
//     );
//     return _response;
//   }
}
