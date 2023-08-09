import 'package:http/http.dart' as http;

import '../../../abstract/host_abst.dart';

class GetHostScannigController {
  final HostAbst hostAbst;

  GetHostScannigController({
    required this.hostAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required int offset,
    required int limit,
    required String lastScan,
  }) async {
    return await hostAbst.getHostScannig(
      username: username,
      password: password,
      offset: offset,
      limit: limit,
      lastScan: lastScan,
    );
  }
}
