import 'package:http/http.dart' as http;

abstract class DeleteContractByIdAbst {
  Future<http.Response> deleteContractById({
    required String id,
  });
}
