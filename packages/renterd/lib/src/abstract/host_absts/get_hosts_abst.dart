import 'package:http/http.dart' as http;

abstract class GetHostsAbst {
  Future<http.Response> getHosts();
}
