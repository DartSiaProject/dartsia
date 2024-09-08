abstract class ObjectAbst {
  Future<Map<String, dynamic>> getListOfBuckets({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  });
  Future<Map<String, dynamic>> getDetailsOfObjects({
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required String fileName,
    required String key,
    required String iv,
  });
  Future<Map<String, dynamic>> copyAndPasteTheObject({
    // String? username,
    // required String password,
    required String serverAddress,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
    required String key,
    required String iv,
  });
  Future<Map<String, dynamic>> deleteTheObject({
    // String? username,
    // required String password,
    required String serverAddress,
    required String fileName,
    required String bucketName,
    required String key,
    required String iv,
  });
  Future<Map<String, dynamic>> getListOfObjectLimited({
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required int limit,
    required String prefix,
    required String key,
    required String iv,
  });
  Future<Map<String, dynamic>> renameSingleObject({
    // String? username,
    // required String password,
    required String serverAddress,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
    required String key,
    required String iv,
  });
}
