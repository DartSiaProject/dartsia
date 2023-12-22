import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/contract_abst.dart';

class AcquireAContractController {
  final ContractAbst contractAbst;

  AcquireAContractController({
    required this.contractAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String id,
    required String duration,
    required int priority,
    required String serverAddress,
  }) async {
    return await contractAbst.acquireAContract(
      username: username,
      password: password,
      id: id,
      duration: duration,
      priority: priority,
      serverAddress: serverAddress,
    );
  }
}
