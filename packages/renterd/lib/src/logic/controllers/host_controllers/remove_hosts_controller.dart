import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/remove_hosts_abst.dart';

class RemoveHostsController {
  final RemoveHostsAbst removeHostsAbst;

  RemoveHostsController({
    required this.removeHostsAbst,
  });

  Future<http.Response> call({
    required int minRecentScanFailures,
    required String maxDowntimeHours,
  }) async {
    return await removeHostsAbst.removeHosts(
        minRecentScanFailures: minRecentScanFailures,
        maxDowntimeHours: maxDowntimeHours);
  }
}
