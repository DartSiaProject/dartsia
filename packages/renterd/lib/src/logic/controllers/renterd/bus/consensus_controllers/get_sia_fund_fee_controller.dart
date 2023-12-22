import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/consensus_abst.dart';

class GetSiaFundFeeController {
  final ConsensusAbst consensusAbst;

  GetSiaFundFeeController({
    required this.consensusAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required int payout,
    required String serverAddress,
  }) async {
    return await consensusAbst.getSiaFundFee(
      username: username,
      password: password,
      payout: payout,
      serverAddress: serverAddress,
    );
  }
}
