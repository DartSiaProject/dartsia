import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/contract_abst.dart';

class ReleasePreviousContractController {
  final ContractAbst contractAbst;

  ReleasePreviousContractController({
    required this.contractAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String id,
    required int lockId,
    required String serverAddress,
  }) async {
    return await contractAbst.releasePreviousContract(
      username: username,
      password: password,
      id: id,
      lockId: lockId,
      serverAddress: serverAddress,
    );
  }
}
