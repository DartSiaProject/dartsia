import 'package:http/http.dart' as http;

abstract class GetContractsAbst {
  Future<http.Response> getContracts();
}
