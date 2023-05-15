import 'package:http/http.dart' as http;

abstract class GetAllAccountsAbst {
  Future<http.Response> getAllAccounts();
}
