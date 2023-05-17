import 'package:http/http.dart' as http;

abstract class UpdateAllowListAbst {
  Future<http.Response> updateAllowList({
    List<String>? addHostList,
    List<String>? removeHostList,
  });
}
