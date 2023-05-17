import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/update_allow_list_abst.dart';
import '../../../apis/host_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [update Allow List] whose Updates the allowlist of the bus by adding/removing hosts by their public key. into response"
/// Author : James Brel
/// onCreated : 17/05/2023
/// onUpadted : #
/// Upadted by : #
class UpdateAllowListImpl implements UpdateAllowListAbst {
  @override
  Future<http.Response> updateAllowList({
    List<String>? addHostList,
    List<String>? removeHostList,
  }) async {
    http.Response _response = await http.put(
        Uri.parse(
          "${dotenv.env['ROOT_URL']}$updateAllowListApi",
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
