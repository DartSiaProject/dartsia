import 'package:http/http.dart' as http;

abstract class GetStateAbst {
  Future<http.Response> getState();
}
