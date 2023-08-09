import 'package:http/http.dart' as http;

import '../../../abstract/hoster_abst.dart';

class GetBlockListController {
  final HosterAbst hosterAbst;

  GetBlockListController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
  }) async {
    return await hosterAbst.getBlockList(
      username: username,
      password: password,
    );
  }
}
