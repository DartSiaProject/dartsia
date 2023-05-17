import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/consensus_absts/get_state_abst.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [get state] whose Returns some info regarding the current state of the consensus.into response"
/// Author : James Brel
/// onCreated : 17/05/2023
/// onUpadted : #
/// Upadted by : #
class GetStateImpl implements GetStateAbst {
  @override
  Future<http.Response> getState() async {
    http.Response _response = await http.get(
      Uri.parse("${dotenv.env['ROOT_URL']}$getState"),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    return _response;
  }
}
