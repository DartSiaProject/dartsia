import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/add_contract_abst.dart';

class AddContractController {
  final AddContractAbst addContractAbst;

  AddContractController({
    required this.addContractAbst,
  });

  Future<http.Response> call({
    required String id,
    required Map<dynamic, dynamic> contract,
    required String totalCost,
    required int startHeight,
  }) async {
    return await addContractAbst.addContract(
      id: id,
      contract: contract,
      totalCost: totalCost,
      startHeight: startHeight,
    );
  }
}
