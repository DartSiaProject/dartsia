import 'package:injectable/injectable.dart';

import '../../data/abstract/consensus_abst.dart';

@Injectable()
class GetSiaFundFeeController {
  final ConsensusAbst consensusAbst;

  GetSiaFundFeeController({
    required this.consensusAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required int payout,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await consensusAbst.getSiaFundFee(
      // username: username,
      // password: password,
      payout: payout,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
