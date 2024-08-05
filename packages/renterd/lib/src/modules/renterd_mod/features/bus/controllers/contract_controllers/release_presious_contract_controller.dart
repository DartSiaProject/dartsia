import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../data/abstract/contract_abst.dart';

@Injectable()
class ReleasePreviousContractController {
  final ContractAbst contractAbst;

  ReleasePreviousContractController({
    required this.contractAbst,
  });

  Future<http.Response> call({
    String? username,
    required String password,
    required String id,
    required int lockId,
    required String serverAddress,
  }) async {
    return await contractAbst.releasePreviousContract(
      username: username,
      password: password,
      id: id,
      lockId: lockId,
      serverAddress: serverAddress,
    );
  }
}
