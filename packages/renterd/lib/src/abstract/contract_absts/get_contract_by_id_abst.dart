import 'package:http/http.dart' as http;

abstract class GetContractByIdAbst {
  Future<http.Response> getContractById({
    required String id,
  });
}
