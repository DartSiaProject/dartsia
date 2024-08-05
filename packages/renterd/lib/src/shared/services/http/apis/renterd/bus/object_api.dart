class ObjectApi {
  static String getBucketsList(String serverAddress) =>
      "$serverAddress/api/bus/buckets";
  static String getTheObject(String serverAddress, String key) =>
      "$serverAddress/api/worker/objects/$key";
  static String updateObject(String serverAddress, String key) =>
      "$serverAddress/api/bus/objects/$key";
  static String deleteObject(
          String serverAddress, String fileNameWithExtension) =>
      "$serverAddress/api/bus/objects/$fileNameWithExtension";
  static String copyAndPasteObject(String serverAddress) =>
      "$serverAddress/api/bus/objects/copy";
  static String getObjectList(String serverAddress) =>
      "$serverAddress/api/bus/objects/list";
  static String renameObjectName(String serverAddress) =>
      "$serverAddress/api/bus/objects/rename";
}
