import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/acquire_a_contract_abst.dart';
import '../../../apis/contracts_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [acquire A Contract] whose Acquires a contract for up to a given duration. Similar to ephemeral accounts, contracts can be unlocked ahead of time using the unlock endpoint with the returned lock id into response"
/// Author : James Brel
/// onCreated : 18/05/2023
/// onUpadted : #
/// Upadted by : #
class AcquireAContractImpl implements AcquireAContractAbst {
  @override
  Future<http.Response> acquireAContract({
    required String id,
    required String duration,
    required int priority,
  }) async {
    http.Response _response = await http.post(
        Uri.parse("${dotenv.env['ROOT_URL']}${acquireAContractApi(id)}"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode({
          "duration": duration,
          "priority": priority,
        }));
    return _response;
  }
}
