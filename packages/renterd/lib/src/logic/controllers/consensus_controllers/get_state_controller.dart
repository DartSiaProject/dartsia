import 'package:http/http.dart' as http;

import '../../../abstract/consensus_abst.dart';

class GetStateController {
  final ConsensusAbst consensusAbst;

  GetStateController({
    required this.consensusAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
  }) async {
    return await consensusAbst.getState(
      username: username,
      password: password,
    );
  }
}
