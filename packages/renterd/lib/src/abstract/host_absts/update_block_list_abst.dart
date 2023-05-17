import 'package:http/http.dart' as http;

abstract class UpdateBlockListAbst {
  Future<http.Response> updateBlockList({
    List<String>? addHostList,
    List<String>? removeHostList,
  });
}
