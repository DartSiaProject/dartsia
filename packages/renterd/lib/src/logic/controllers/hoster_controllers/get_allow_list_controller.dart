import 'package:http/http.dart' as http;

import '../../../abstract/hoster_abst.dart';

class GetAllowListController {
  final HosterAbst hosterAbst;

  GetAllowListController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String ipAdress,
  }) async {
    return await hosterAbst.getAllowList(
      username: username,
      password: password,
      ipAdress: ipAdress,
    );
  }
}
