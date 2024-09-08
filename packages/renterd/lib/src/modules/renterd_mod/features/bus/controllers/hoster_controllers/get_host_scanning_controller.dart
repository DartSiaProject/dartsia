import 'package:injectable/injectable.dart';

import '../../data/abstract/hoster_abst.dart';

@Injectable()
class GetHostScannigController {
  final HosterAbst hosterAbst;

  GetHostScannigController({
    required this.hosterAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required int offset,
    required int limit,
    required String lastScan,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await hosterAbst.getHostScannig(
      // username: username,
      // password: password,
      offset: offset,
      limit: limit,
      lastScan: lastScan,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
