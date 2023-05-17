import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/accounts_absts/get_all_accounts_abst.dart';
import '../../../apis/account_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [get all accounts] whose Returns all known ephemeral accounts from the bus, into response"
/// Author : James Brel
/// onCreated : 14/05/2023
/// onUpadted : #
/// Upadted by : #
class GetAllAccountsImpl implements GetAllAccountsAbst {
  @override
  Future<http.Response> getAllAccounts() async {
    http.Response _response = await http.get(
      Uri.parse("${dotenv.env['ROOT_URL']}$getAccountsApi"),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    return _response;
  }
}
