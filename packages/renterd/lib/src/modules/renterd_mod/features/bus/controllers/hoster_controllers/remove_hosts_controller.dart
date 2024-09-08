import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class RemoveHostsController {
  final HosterAbst hosterAbst;

  RemoveHostsController({
    required this.hosterAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required int minRecentScanFailures,
    required String maxDowntimeHours,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await hosterAbst.removeHosts(
      // username: username,
      // password: password,
      minRecentScanFailures: minRecentScanFailures,
      maxDowntimeHours: maxDowntimeHours,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
