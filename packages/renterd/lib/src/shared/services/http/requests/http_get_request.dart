// todo : Remove the comment marks once to enable this file

// import 'package:dio/dio.dart';

// import '../../../constants/lang_const.dart';
// import '../configs/dio_instance.dart';

// class HttpGetRequest {
//   static Future<Map<String, dynamic>> get({
//     required String api,
//     required Map<String, String> headers,
//   }) async {
//     return await dio
//         .get<String>(
//           api,
//           options: Options(
//             headers: headers,
//           ),
//         )
//         .then((response) => {
//               "status": true,
//               "response": response,
//             })
//         .onError<DioException>((error, stackTrace) {
//       return {
//         "status": false,
//         "message": error.type == DioExceptionType.connectionTimeout ||
//                 error.type == DioExceptionType.receiveTimeout
//             ? Lang.timeError
//             : Lang.unknownError,
//       };
//     });
//   }
// }
