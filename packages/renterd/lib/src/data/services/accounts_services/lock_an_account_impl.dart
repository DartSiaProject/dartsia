import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/lock_an_account_abst.dart';
import '../../../apis/account_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function Lock An Account whose Commonly used by the worker, this endpoint allows for locking an account either exclusively or not. into response"
/// Author : James Brel
/// onCreated : 15/05/2023
/// onUpadted : #
/// Upadted by : James Brel
class LockAnAccountImpl implements LockAnAccountAbst {
  @override
  Future<http.Response> lockAnAccount({
    required String accountId,
    required String hostKey,
    required bool exclusive,
  }) async {
    http.Response _response = await http.post(
        Uri.parse("${dotenv.env['ROOT_URL']}${lockAnAccountApi(accountId)}"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode({
          "hostKey": hostKey,
          "exclusive": exclusive,
          "duration": "1000",
        }));
    return _response;
  }
}
