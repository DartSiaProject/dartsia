import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/update_block_list_abst.dart';
import '../../../apis/host_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [update Block List] whose Updates the blocklist of the bus by adding/removing hosts by their domain or IP address into response"
/// Author : James Brel
/// onCreated : 17/05/2023
/// onUpadted : #
/// Upadted by : #
class UpdateBlockListImpl implements UpdateBlockListAbst {
  @override
  Future<http.Response> updateBlockList({
    List<String>? addHostList,
    List<String>? removeHostList,
  }) async {
    http.Response _response = await http.put(
        Uri.parse(
          "${dotenv.env['ROOT_URL']}$updateBlockListApi",
        ),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode({
          "add": addHostList,
          "remove": removeHostList,
          "clear": false,
        }));
    return _response;
  }
}
