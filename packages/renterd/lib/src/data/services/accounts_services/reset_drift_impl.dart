import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/reset_drift_abst.dart';
import '../../../apis/account_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function reset Drift whose Resets the drift on ephemeral accounts. The drift tracks by how much Siacoin the expected balance of renterd differs from the host's over time. If the drift is too large, the autopilot refuses to pour more money into a host's account. Resetting the drift will cause the autopilot to fund the account again. into response"
/// Author : James Brel
/// onCreated : 15/05/2023
/// onUpadted : #
/// Upadted by : James Brel
class ResetDriftImpl implements ResetDriftAbst {
  @override
  Future<http.Response> resetDrift({
    required String accountId,
    required String host,
    required int amount,
  }) async {
    http.Response _response = await http.post(
        Uri.parse("${dotenv.env['ROOT_URL']}${resetDriftApi(accountId)}"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode({
          "host": host,
          "amount": amount,
        }));
    return _response;
  }
}
