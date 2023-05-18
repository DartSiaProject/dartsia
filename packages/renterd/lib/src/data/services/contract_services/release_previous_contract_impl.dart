import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/release_previous_contract_abst.dart';
import '../../../apis/contracts_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [release Previous Contract] whose Releases a previously acquired contract using the obtained lock id into response"
/// Author : James Brel
/// onCreated : 18/05/2023
/// onUpadted : #
/// Upadted by : #
class ReleasePreviousContractImpl implements ReleasePreviousContractAbst {
  @override
  Future<http.Response> releasePreviousContract({
    required String id,
    required int lockId,
  }) async {
    http.Response _response = await http.post(
        Uri.parse("${dotenv.env['ROOT_URL']}${releasePreviousContractApi(id)}"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode({
          "lockID": lockId,
        }));
    return _response;
  }
}