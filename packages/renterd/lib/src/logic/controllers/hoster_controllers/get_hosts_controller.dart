import 'package:http/http.dart' as http;

import '../../../abstract/hoster_abst.dart';

class GetHostsController {
  final HosterAbst hosterAbst;

  GetHostsController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String ipAdress,
  }) async {
    return await hosterAbst.getHosts(
      username: username,
      password: password,
      ipAdress: ipAdress,
    );
  }
}
