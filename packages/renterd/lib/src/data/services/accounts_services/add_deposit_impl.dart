import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/add_deposit_abst.dart';
import '../../../apis/account_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function add a deposit whose Endpoint used for depositing or withdrawing tokens into/from an ephemeral account. The caller should hold a non-exlusive lock on the account.into response"
/// Author : James Brel
/// onCreated : 15/05/2023
/// onUpadted : #
/// Upadted by : James Brel

class AddDepositImpl implements AddDepositAbst {
  @override
  Future<http.Response> addDeposit({
    required String accountId,
    required String host,
    required int amount,
  }) async {
    http.Response _response = await http.post(
        Uri.parse("${dotenv.env['ROOT_URL']}${addDepositApi(accountId)}"),
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
