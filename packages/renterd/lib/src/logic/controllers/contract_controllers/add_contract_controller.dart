import 'package:http/http.dart' as http;

import '../../../abstract/contract_abst.dart';

class AddContractController {
  final ContractAbst contractAbst;

  AddContractController({
    required this.contractAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String id,
    required Map<dynamic, dynamic> contract,
    required String totalCost,
    required int startHeight,
    required String ipAdress,
  }) async {
    return await contractAbst.addContract(
      username: username,
      password: password,
      id: id,
      contract: contract,
      totalCost: totalCost,
      startHeight: startHeight,
      ipAdress: ipAdress,
    );
  }
}
