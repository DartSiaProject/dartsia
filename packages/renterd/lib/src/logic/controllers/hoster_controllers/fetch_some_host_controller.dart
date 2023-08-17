import 'package:http/http.dart' as http;

import '../../../abstract/hoster_abst.dart';

class FetchSomeHostController {
  final HosterAbst hosterAbst;

  FetchSomeHostController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String ipAdress,
  }) async {
    return await hosterAbst.fetchSomeHost(
      username: username,
      password: password,
      ipAdress: ipAdress,
    );
  }
}
