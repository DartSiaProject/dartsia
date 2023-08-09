import 'package:http/http.dart' as http;

import '../../../abstract/hoster_abst.dart';

class GetHostScannigController {
  final HosterAbst hosterAbst;

  GetHostScannigController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required int offset,
    required int limit,
    required String lastScan,
  }) async {
    return await hosterAbst.getHostScannig(
      username: username,
      password: password,
      offset: offset,
      limit: limit,
      lastScan: lastScan,
    );
  }
}
