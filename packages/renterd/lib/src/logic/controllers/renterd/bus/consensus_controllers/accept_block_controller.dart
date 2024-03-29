import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/consensus_abst.dart';

class AcceptBlockController {
  final ConsensusAbst consensusAbst;

  AcceptBlockController({
    required this.consensusAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
    required String serverAddress,
  }) async {
    return await consensusAbst.acceptBlock(
      username: username,
      password: password,
      parentId: parentId,
      address: address,
      value: value,
      arbitraryDataList: arbitraryDataList,
      serverAddress: serverAddress,
    );
  }
}
