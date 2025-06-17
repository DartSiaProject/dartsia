abstract class HosterAbst {
  Future<Map<String, dynamic>> getAllowList({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> getBlockList({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> getHostInfoByPublicKey({
    // String? username,
    // required String password,
    required String publicKey,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> getHostScannig({
    // String? username,
    // required String password,
    required int offset,
    required int limit,
    required String lastScan,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> getHosts({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> postInteraction({
    // String? username,
    // required String password,
    required List<String> hostScanData,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> removeHosts({
    // String? username,
    // required String password,
    required int minRecentScanFailures,
    required String maxDowntimeHours,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> updateAllowList({
    // String? username,
    // required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> updateBlockList({
    // String? username,
    // required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> fetchSomeHost({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  });

  Future<Map<String, dynamic>> updateSomeHost({
    // String? username,
    // required String password,
    required Map<String, dynamic> hostConfig,
    required String serverAddress,
    required String key,
    required String iv,
  });
}
