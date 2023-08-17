import 'package:http/http.dart' as http;

abstract class HosterAbst {
  Future<http.Response> getAllowList({
    String? username,
    required String password,
    required String ipAdress,
  });

  Future<http.Response> getBlockList({
    String? username,
    required String password,
    required String ipAdress,
  });

  Future<http.Response> getHostInfoByPublicKey({
    String? username,
    required String password,
    required String publicKey,
    required String ipAdress,
  });

  Future<http.Response> getHostScannig({
    String? username,
    required String password,
    required int offset,
    required int limit,
    required String lastScan,
    required String ipAdress,
  });

  Future<http.Response> getHosts({
    String? username,
    required String password,
    required String ipAdress,
  });

  Future<http.Response> postInteraction({
    String? username,
    required String password,
    required List<String> hostScanData,
    required String ipAdress,
  });

  Future<http.Response> removeHosts({
    String? username,
    required String password,
    required int minRecentScanFailures,
    required String maxDowntimeHours,
    required String ipAdress,
  });

  Future<http.Response> updateAllowList({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
    required String ipAdress,
  });

  Future<http.Response> updateBlockList({
    String? username,
    required String password,
    required List<String> addHostList,
    required List<String> removeHostList,
    required String ipAdress,
  });

  Future<http.Response> fetchSomeHost({
    String? username,
    required String password,
    required String ipAdress,
  });

  Future<http.Response> updateSomeHost({
    String? username,
    required String password,
    required Map<String, dynamic> hostConfig,
    required String ipAdress,
  });
}
