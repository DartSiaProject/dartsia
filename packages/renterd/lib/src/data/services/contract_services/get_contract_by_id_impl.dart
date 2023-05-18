import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/get_contract_by_id_abst.dart';
import '../../../apis/contracts_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [get Contract By Id] whose Returns contract metadata for an active contract with the provided contract id into response"
/// Author : James Brel
/// onCreated : 18/05/2023
/// onUpadted : #
/// Upadted by : #
class GetContractByIdImpl implements GetContractByIdAbst {
  @override
  Future<http.Response> getContractById({
    required String id,
  }) async {
    http.Response _response = await http.get(
      Uri.parse("${dotenv.env['ROOT_URL']}${getContractByIdApi(id)}"),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    return _response;
  }
}
