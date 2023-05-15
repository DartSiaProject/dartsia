import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/get_an_account_by_id_abst.dart';
import '../../../apis/account_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function  get An Account By Id whose Returns the account with the given ID. If it doesn't exist, it will be created. The provided host's key will be attached to the account as additional metadata., into response"
/// Author : James Brel
/// onCreated : 14/05/2023
/// onUpadted : #
/// Upadted by : James Brel
class GetAnAccountByIdImpl implements GetAnAccountByIdAbst {
  @override
  Future<http.Response> getAnAccountById({
    required String accountId,
    required String hostKey,
  }) async {
    http.Response _response = await http.post(
        Uri.parse("${dotenv.env['ROOT_URL']}${getAnAccountByIdApi(accountId)}"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode({"hostKey": hostKey}));
    return _response;
  }
}
