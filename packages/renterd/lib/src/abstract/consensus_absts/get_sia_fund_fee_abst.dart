import 'package:http/http.dart' as http;

abstract class GetSiaFundFeeAbst {
  Future<http.Response> getSiaFundFee({required int payout});
}
