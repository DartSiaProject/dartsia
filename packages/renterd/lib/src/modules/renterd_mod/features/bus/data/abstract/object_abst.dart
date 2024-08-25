abstract class ObjectAbst {
  Future<Map<String, dynamic>> getListOfBuckets({
    String? username,
    required String password,
    required String serverAddress,
  });
  Future<Map<String, dynamic>> getDetailsOfObjects({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required String fileName,
  });
  Future<Map<String, dynamic>> copyAndPasteTheObject({
    String? username,
    required String password,
    required String serverAddress,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
  });
  Future<Map<String, dynamic>> deleteTheObject({
    String? username,
    required String password,
    required String serverAddress,
    required String fileName,
    required String bucketName,
  });
  Future<Map<String, dynamic>> getListOfObjectLimited({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required int limit,
    String? prefix,
  });
  Future<Map<String, dynamic>> renameSingleObject({
    String? username,
    required String password,
    required String serverAddress,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
  });
}
