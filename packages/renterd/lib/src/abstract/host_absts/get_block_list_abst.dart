import 'package:http/http.dart' as http;

abstract class GetBlockListAbst {
  Future<http.Response> getBlockList();
}
