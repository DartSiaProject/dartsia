import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/get_all_accounts_abst.dart';

class GetAllAccountsController {
  final GetAllAccountsAbst getAllAccountsAbst;

  GetAllAccountsController({
    required this.getAllAccountsAbst,
  });

  Future<http.Response> call() async {
    return await getAllAccountsAbst.getAllAccounts();
  }
}
