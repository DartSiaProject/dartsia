import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/update_balance_abst.dart';
import '../../../apis/account_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function update Balance whose Updates the balance of an account to the provided value. The caller should acquire an exclusive lock before calling this endpoint, into response"
/// Author : James Brel
/// onCreated : 15/05/2023
/// onUpadted : #
/// Upadted by : James Brel
class UpdateBalanceImpl implements UpdateBalanceAbst {
  @override
  Future<http.Response> updateBalance({
    required String accountId,
    required String host,
    required int amount,
  }) async {
    http.Response _response = await http.post(
        Uri.parse("${dotenv.env['ROOT_URL']}${updateBalanceApi(accountId)}"),
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
