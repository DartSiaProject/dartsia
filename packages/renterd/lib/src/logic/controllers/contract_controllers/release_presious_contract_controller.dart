import 'package:http/http.dart' as http;

import '../../../abstract/contract_abst.dart';

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
    required String ipAdress,
  }) async {
    return await contractAbst.releasePreviousContract(
      username: username,
      password: password,
      id: id,
      lockId: lockId,
      ipAdress: ipAdress,
    );
  }
}
