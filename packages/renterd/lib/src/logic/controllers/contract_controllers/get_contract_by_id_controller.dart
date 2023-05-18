import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/get_contract_by_id_abst.dart';

class GetContractByIdController {
  final GetContractByIdAbst getContractByIdAbst;

  GetContractByIdController({
    required this.getContractByIdAbst,
  });

  Future<http.Response> call({
    required String id,
  }) async {
    return await getContractByIdAbst.getContractById(id: id);
  }
}
