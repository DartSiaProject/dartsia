import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/consensus_absts/get_sia_fund_fee_abst.dart';
import '../../../apis/consensus_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [get SiaFund Fee] whose Given the total payout of a contract, this endpoint returns the appropriate siafund fee to pay.into response"
/// Author : James Brel
/// onCreated : 17/05/2023
/// onUpadted : #
/// Upadted by : #
class GetSiaFundFeeImpl implements GetSiaFundFeeAbst {
  @override
  Future<http.Response> getSiaFundFee({required int payout}) async {
    http.Response _response = await http.get(
      Uri.parse("${dotenv.env['ROOT_URL']}${getTotalPayoutApi(payout)}"),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    return _response;
  }
}
