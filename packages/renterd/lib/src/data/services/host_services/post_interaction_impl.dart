import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/post_interaction_abst.dart';
import '../../../apis/host_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [post Interaction] whose Records host ineractions in the bus. Commonly called by workers when scanning hosts into response"
/// Author : James Brel
/// onCreated : 17/05/2023
/// onUpadted : #
/// Upadted by : #
class PostInteractionImpl implements PostInteractionAbst {
  @override
  Future<http.Response> postInteraction({
    required List<String> hostScanData,
  }) async {
    http.Response _response = await http.post(
        Uri.parse(
          "${dotenv.env['ROOT_URL']}$postInteractionApi",
        ),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode(hostScanData));
    return _response;
  }
}
