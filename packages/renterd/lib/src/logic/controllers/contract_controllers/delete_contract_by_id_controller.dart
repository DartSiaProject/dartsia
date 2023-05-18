import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/delete_contract_by_id_abst.dart';

class DeleteContractByIdController {
  final DeleteContractByIdAbst deleteContractByIdAbst;

  DeleteContractByIdController({
    required this.deleteContractByIdAbst,
  });

  Future<http.Response> call({
    required String id,
  }) async {
    return await deleteContractByIdAbst.deleteContractById(id: id);
  }
}
