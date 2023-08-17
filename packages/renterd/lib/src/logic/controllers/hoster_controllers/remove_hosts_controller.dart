import 'package:http/http.dart' as http;

import '../../../abstract/hoster_abst.dart';

class RemoveHostsController {
  final HosterAbst hosterAbst;

  RemoveHostsController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required int minRecentScanFailures,
    required String maxDowntimeHours,
    required String ipAdress,
  }) async {
    return await hosterAbst.removeHosts(
      username: username,
      password: password,
      minRecentScanFailures: minRecentScanFailures,
      maxDowntimeHours: maxDowntimeHours,
      ipAdress: ipAdress,
    );
  }
}
