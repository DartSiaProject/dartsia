import 'package:http/http.dart' as http;

import '../../../abstract/host_abst.dart';

class PostInteractionController {
  final HostAbst hostAbst;

  PostInteractionController({
    required this.hostAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required List<String> hostScanData,
  }) async {
    return await hostAbst.postInteraction(
      username: username,
      password: password,
      hostScanData: hostScanData,
    );
  }
}
