import 'package:injectable/injectable.dart';

import '../../data/abstract/contract_abst.dart';

@Injectable()
class GetContractsController {
  final ContractAbst contractAbst;

  GetContractsController({
    required this.contractAbst,
  });

  Future<Map<String, dynamic>> call({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    return await contractAbst.getContracts(
      username: username,
      password: password,
      serverAddress: serverAddress,
    );
  }
}
