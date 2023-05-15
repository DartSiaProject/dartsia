import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/sync_balance_abst.dart';
import '../../../apis/account_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function sync Balance whose updateBalance, into response"
/// Author : James Brel
/// onCreated : 15/05/2023
/// onUpadted : #
/// Upadted by : James Brel
class SyncBalanceImpl implements SyncBalanceAbst {
  @override
  Future<http.Response> syncBalance({
    required String accountId,
    required String host,
  }) async {
    http.Response _response = await http.post(
        Uri.parse("${dotenv.env['ROOT_URL']}${syncBalanceApi(accountId)}"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode({
          "host": host,
        }));
    return _response;
  }
}
