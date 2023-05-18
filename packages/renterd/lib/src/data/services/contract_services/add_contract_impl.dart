import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/add_contract_abst.dart';
import '../../../apis/contracts_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [add Contract] whose Adds a contract to the bus. Usually called by workers after forming a new contract response"
/// Author : James Brel
/// onCreated : 18/05/2023
/// onUpadted : #
/// Upadted by : #
class AddContractImpl implements AddContractAbst {
  @override
  Future<http.Response> addContract({
    required String id,
    required Map<dynamic, dynamic> contract,
    required String totalCost,
    required int startHeight,
  }) async {
    http.Response _response = await http.post(
      Uri.parse("${dotenv.env['ROOT_URL']}${postContractsApi(id)}"),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: json.encode(
        {
          "contract": contract,
          "startHeight": startHeight,
          "totalCost": totalCost
        },
      ),
    );
    return _response;
  }
}
