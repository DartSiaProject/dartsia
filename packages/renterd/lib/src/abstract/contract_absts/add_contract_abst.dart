import 'package:http/http.dart' as http;

abstract class AddContractAbst {
  Future<http.Response> addContract({
    required String id,
    required Map<dynamic, dynamic> contract,
    required String totalCost,
    required int startHeight,
  });
}
