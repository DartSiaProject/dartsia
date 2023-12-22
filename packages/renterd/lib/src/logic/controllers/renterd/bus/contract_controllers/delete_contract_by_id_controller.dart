import 'package:http/http.dart' as http;

import '../../../../../abstract/renterd/bus/contract_abst.dart';

class DeleteContractByIdController {
  final ContractAbst contractAbst;

  DeleteContractByIdController({
    required this.contractAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String id,
    required String serverAddress,
  }) async {
    return await contractAbst.deleteContractById(
      username: username,
      password: password,
      id: id,
      serverAddress: serverAddress,
    );
  }
}
