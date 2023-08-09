import 'package:http/http.dart' as http;

abstract class ConsensusAbst {
  Future<http.Response> acceptBlock({
    String? username,
    required String password,
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
  });

  Future<http.Response> getSiaFundFee({
    String? username,
    required String password,
    required int payout,
  });

  Future<http.Response> getState({
    String? username,
    required String password,
  });
}