import 'package:http/http.dart' as http;

abstract class GetHostScannigAbst {
  Future<http.Response> getHostScannig({
    required int offset,
    required int limit,
    required String lastScan,
  });
}
