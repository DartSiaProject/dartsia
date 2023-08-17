import 'package:http/http.dart' as http;

import '../../../abstract/hoster_abst.dart';

class PostInteractionController {
  final HosterAbst hosterAbst;

  PostInteractionController({
    required this.hosterAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required List<String> hostScanData,
    required String ipAdress,
  }) async {
    return await hosterAbst.postInteraction(
      username: username,
      password: password,
      hostScanData: hostScanData,
      ipAdress: ipAdress,
    );
  }
}
