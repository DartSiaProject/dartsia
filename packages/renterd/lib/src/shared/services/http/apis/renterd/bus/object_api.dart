class ObjectApi {
  static String getBucketsList(String serverAddress) =>
      "$serverAddress/api/bus/buckets";
  static String getTheDetailsObject(
          String serverAddress, String bucketName, String fileName) =>
      "$serverAddress/api/bus/objects/$fileName?bucket=$bucketName";

  static String downloadTheObject(
          String serverAddress, String bucketName, String fileName) =>
      "$serverAddress/api/worker/objects/$fileName?bucket=$bucketName";

  static String uploadTheObject(
          String serverAddress, String bucketName, String fileName) =>
      "$serverAddress/api/worker/objects/$fileName?bucket=$bucketName";

  static String deleteObject(
          String serverAddress, String fileName, String bucketName) =>
      "$serverAddress/api/bus/objects/$fileName?batch=false&bucket=$bucketName";

  static String copyAndPasteObject(String serverAddress) =>
      "$serverAddress/api/bus/objects/copy";
  static String getObjectList(String serverAddress) =>
      "$serverAddress/api/bus/objects/list";
  static String renameObjectName(String serverAddress) =>
      "$serverAddress/api/bus/objects/rename";
}
