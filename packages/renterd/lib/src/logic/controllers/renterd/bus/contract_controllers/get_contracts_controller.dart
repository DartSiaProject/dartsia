import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/contract_abst.dart';

class GetContractsController {
  final ContractAbst contractAbst;

  GetContractsController({
    required this.contractAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    return await contractAbst.getContracts(
      username: username,
      password: password,
      serverAddress: serverAddress,
    );
  }
}
