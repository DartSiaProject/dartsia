import 'package:http/http.dart' as http;

import '../../../abstract/host_abst.dart';

class RemoveHostsController {
  final HostAbst hostAbst;

  RemoveHostsController({
    required this.hostAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required int minRecentScanFailures,
    required String maxDowntimeHours,
  }) async {
    return await hostAbst.removeHosts(
      username: username,
      password: password,
      minRecentScanFailures: minRecentScanFailures,
      maxDowntimeHours: maxDowntimeHours,
    );
  }
}
