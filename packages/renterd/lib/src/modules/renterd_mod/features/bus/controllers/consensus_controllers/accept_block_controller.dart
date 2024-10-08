import 'package:injectable/injectable.dart';

import '../../data/abstract/consensus_abst.dart';

@Injectable()
class AcceptBlockController {
  final ConsensusAbst consensusAbst;

  AcceptBlockController({
    required this.consensusAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await consensusAbst.acceptBlock(
      // username: username,
      // password: password,
      parentId: parentId,
      address: address,
      value: value,
      arbitraryDataList: arbitraryDataList,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
