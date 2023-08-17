import 'package:http/http.dart' as http;

import '../../../abstract/contract_abst.dart';

class GetContractByIdController {
  final ContractAbst contractAbst;

  GetContractByIdController({
    required this.contractAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String id,
    required String ipAdress,
  }) async {
    return await contractAbst.getContractById(
      username: username,
      password: password,
      id: id,
      ipAdress: ipAdress,
    );
  }
}
