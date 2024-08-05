import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
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
    required String serverAddress,
  }) async {
    return await hosterAbst.removeHosts(
      username: username,
      password: password,
      minRecentScanFailures: minRecentScanFailures,
      maxDowntimeHours: maxDowntimeHours,
      serverAddress: serverAddress,
    );
  }
}
