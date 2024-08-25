import 'package:injectable/injectable.dart';

import '../../data/abstract/contract_abst.dart';

@Injectable()
class AcquireAContractController {
  final ContractAbst contractAbst;

  AcquireAContractController({
    required this.contractAbst,
  });

  Future<Map<String, dynamic>> call({
    String? username,
    required String password,
    required String id,
    required String duration,
    required int priority,
    required String serverAddress,
  }) async {
    return await contractAbst.acquireAContract(
      username: username,
      password: password,
      id: id,
      duration: duration,
      priority: priority,
      serverAddress: serverAddress,
    );
  }
}
