import 'package:injectable/injectable.dart';

import '../../data/abstract/contract_abst.dart';

@Injectable()
class AddContractController {
  final ContractAbst contractAbst;

  AddContractController({
    required this.contractAbst,
  });

  Future<Map<String, dynamic>> call({
    String? username,
    required String password,
    required String id,
    required Map<dynamic, dynamic> contract,
    required String totalCost,
    required int startHeight,
    required String serverAddress,
  }) async {
    return await contractAbst.addContract(
      username: username,
      password: password,
      id: id,
      contract: contract,
      totalCost: totalCost,
      startHeight: startHeight,
      serverAddress: serverAddress,
    );
  }
}
