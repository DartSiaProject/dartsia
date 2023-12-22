import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/hoster_abst.dart';

class GetBlockListController {
  final HosterAbst hosterAbst;

  GetBlockListController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    return await hosterAbst.getBlockList(
      username: username,
      password: password,
      serverAddress: serverAddress,
    );
  }
}
