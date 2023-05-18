import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/get_contracts_abst.dart';

class GetContractsController {
  final GetContractsAbst getContractsAbst;

  GetContractsController({
    required this.getContractsAbst,
  });

  Future<http.Response> call() async {
    return await getContractsAbst.getContracts();
  }
}
