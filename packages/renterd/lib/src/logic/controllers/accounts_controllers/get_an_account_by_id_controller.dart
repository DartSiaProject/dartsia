import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/get_an_account_by_id_abst.dart';

class GetAnAccountByIdController {
  final GetAnAccountByIdAbst getAnAccountByIdAbst;

  GetAnAccountByIdController({
    required this.getAnAccountByIdAbst,
  });

  Future<http.Response> call({
    required String accountId,
    required String hostKey,
  }) async {
    return await getAnAccountByIdAbst.getAnAccountById(
      accountId: accountId,
      hostKey: hostKey,
    );
  }
}
