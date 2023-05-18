import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/contract_absts/delete_contract_by_id_abst.dart';
import '../../../apis/contracts_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [delete Contract By Id] whose Deletes a contract from the bus. This doesn't remove the contract from the blockchain. The bus only stops being aware of the contract's existence and will therefore stop using it into response"
/// Author : James Brel
/// onCreated : 18/05/2023
/// onUpadted : #
/// Upadted by : #
class DeleteContractByIdImpl implements DeleteContractByIdAbst {
  @override
  Future<http.Response> deleteContractById({
    required String id,
  }) async {
    http.Response _response = await http.delete(
      Uri.parse("${dotenv.env['ROOT_URL']}${deleteContractByIdApi(id)}"),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    return _response;
  }
}
