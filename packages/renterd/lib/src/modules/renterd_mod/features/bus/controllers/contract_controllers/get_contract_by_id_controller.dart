import 'package:injectable/injectable.dart';

import '../../data/abstract/contract_abst.dart';

@Injectable()
class GetContractByIdController {
  final ContractAbst contractAbst;

  GetContractByIdController({
    required this.contractAbst,
  });

  Future<Map<String, dynamic>> call({
    // String? username,
    // required String password,
    required String id,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    return await contractAbst.getContractById(
      // username: username,
      // password: password,
      id: id,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
