import 'package:http/http.dart' as http;

abstract class AcceptBlockAbst {
  Future<http.Response> acceptBlock({
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
  });
}
