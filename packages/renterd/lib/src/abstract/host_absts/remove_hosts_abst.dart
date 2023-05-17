import 'package:http/http.dart' as http;

abstract class RemoveHostsAbst {
  Future<http.Response> removeHosts({
    required int minRecentScanFailures,
    required String maxDowntimeHours,
  });
}
