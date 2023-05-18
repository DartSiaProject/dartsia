import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/acquire_a_contract_abst.dart';

class AcquireAContractController {
  final AcquireAContractAbst acquireAContractAbst;

  AcquireAContractController({
    required this.acquireAContractAbst,
  });

  Future<http.Response> call({
    required String id,
    required String duration,
    required int priority,
  }) async {
    return await acquireAContractAbst.acquireAContract(
      id: id,
      duration: duration,
      priority: priority,
    );
  }
}
