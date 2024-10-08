import 'package:injectable/injectable.dart';

import '../../data/abstract/contract_abst.dart';

@Injectable()
class DeleteContractByIdController {
  final ContractAbst contractAbst;

  DeleteContractByIdController({
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
    return await contractAbst.deleteContractById(
      // username: username,
      // password: password,
      id: id,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
