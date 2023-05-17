import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/get_block_list_abst.dart';
import '../../../apis/host_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [get Block List] whose Returns the current blocklist of the bus into response"
/// Author : James Brel
/// onCreated : 17/05/2023
/// onUpadted : #
/// Upadted by : #
class GetBlockListImpl implements GetBlockListAbst {
  @override
  Future<http.Response> getBlockList() async {
    http.Response _response = await http.get(
      Uri.parse(
        "${dotenv.env['ROOT_URL']}$getBlockListApi",
      ),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    return _response;
  }
}
