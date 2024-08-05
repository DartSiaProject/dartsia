import 'package:http/http.dart' as http;

abstract class ObjectAbst {
  Future<http.Response> getListOfBuckets({
    String? username,
    required String password,
    required String serverAddress,
  });
  Future<http.Response> copyAndPasteTheObject({
    String? username,
    required String password,
    required String serverAddress,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
  });
  Future<http.Response> deleteTheObject({
    String? username,
    required String password,
    required String serverAddress,
    required String fileNameWithExtension,
  });
  Future<http.Response> getListOfObjectLimited({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required int limit,
    String? prefix,
  });
  Future<http.Response> renameSingleObject({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
  });
}
