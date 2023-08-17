import 'package:http/http.dart' as http;

import '../../../abstract/hoster_abst.dart';

class UpdateSomeHostController {
  final HosterAbst hosterAbst;

  UpdateSomeHostController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required Map<String, dynamic> hostConfig,
    required String ipAdress,
  }) async {
    return await hosterAbst.updateSomeHost(
      username: username,
      password: password,
      hostConfig: hostConfig,
      ipAdress: ipAdress,
    );
  }
}
