import 'package:injectable/injectable.dart';

import '../../data/abstract/consensus_abst.dart';

@Injectable()
class GetStateController {
  final ConsensusAbst consensusAbst;

  GetStateController({
    required this.consensusAbst,
  });

  Future<Map<String, dynamic>> call({
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
