import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/consensus_abst.dart';

@Injectable()
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
