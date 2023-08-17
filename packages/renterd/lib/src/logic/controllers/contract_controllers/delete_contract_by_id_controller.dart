import 'package:http/http.dart' as http;

import '../../../abstract/contract_abst.dart';

class DeleteContractByIdController {
  final ContractAbst contractAbst;

  DeleteContractByIdController({
    required this.contractAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String id,
    required String ipAdress,
  }) async {
    return await contractAbst.deleteContractById(
      username: username,
      password: password,
      id: id,
      ipAdress: ipAdress,
    );
  }
}
