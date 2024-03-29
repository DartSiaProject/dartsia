import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/consensus_abst.dart';

class GetStateController {
  final ConsensusAbst consensusAbst;

  GetStateController({
    required this.consensusAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    return await consensusAbst.getState(
      username: username,
      password: password,
      serverAddress: serverAddress,
    );
  }
}
