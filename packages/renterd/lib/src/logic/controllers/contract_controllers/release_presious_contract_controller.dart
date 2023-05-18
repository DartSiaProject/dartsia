import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/release_previous_contract_abst.dart';

class ReleasePreviousContractController {
  final ReleasePreviousContractAbst releasePreviousContractAbst;

  ReleasePreviousContractController({
    required this.releasePreviousContractAbst,
  });

  Future<http.Response> call({
    required String id,
    required int lockId,
  }) async {
    return await releasePreviousContractAbst.releasePreviousContract(
      id: id,
      lockId: lockId,
    );
  }
}
