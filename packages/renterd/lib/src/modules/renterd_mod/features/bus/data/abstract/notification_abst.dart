abstract class NotificationAbst {
  Future<Map<String, dynamic>> findAll({
    required String serverAddress,
    required String key,
    required String iv,
    int limit = 10,
    int offset = 0,
  });

  Future<Map<String, dynamic>> dismissList({
    required String serverAddress,
    required String key,
    required String iv,
    required List<String> ids,
  });
}
