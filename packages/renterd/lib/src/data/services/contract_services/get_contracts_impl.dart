import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/get_contracts_abst.dart';
import '../../../apis/contracts_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [get Contracts] whose Returns all active contracts the bus is aware of. This includes all contracts that have not expired, have not been renewed and also not manually archived yet. Contracts are also active if they are not part of a contract set into response"
/// Author : James Brel
/// onCreated : 18/05/2023
/// onUpadted : #
/// Upadted by : #
class GetContractsImpl implements GetContractsAbst {
  @override
  Future<http.Response> getContracts() async {
    http.Response _response = await http.get(
      Uri.parse("${dotenv.env['ROOT_URL']}$getContractsApi"),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    return _response;
  }
}
