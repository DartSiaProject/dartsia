import 'package:http/http.dart' as http;

import '../../../abstract/consensus_absts/get_sia_fund_fee_abst.dart';

class GetSiaFundFeeController {
  final GetSiaFundFeeAbst getSiaFundFeeAbst;

  GetSiaFundFeeController({
    required this.getSiaFundFeeAbst,
  });

  Future<http.Response> call({required int payout}) async {
    return await getSiaFundFeeAbst.getSiaFundFee(payout: payout);
  }
}
