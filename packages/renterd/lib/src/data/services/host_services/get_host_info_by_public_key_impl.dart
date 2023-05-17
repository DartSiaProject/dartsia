import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/host_absts/get_host_info_by_public_key_abst.dart';
import '../../../apis/host_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [get Host Info By Public Key] whose Returns some information about the host identified by a given public key into response"
/// Author : James Brel
/// onCreated : 17/05/2023
/// onUpadted : #
/// Upadted by : #
class GetHostInfoByPublicKeyImpl implements GetHostInfoByPublicKeyAbst {
  @override
  Future<http.Response> getHostInfoByPublicKey(
      {required String publicKey}) async {
    http.Response _response = await http.get(
      Uri.parse(
        "${dotenv.env['ROOT_URL']}${getHostInfoByPublicKeyApi(publicKey)}",
      ),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    return _response;
  }
}
