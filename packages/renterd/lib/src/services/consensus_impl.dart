import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../abstract/consensus_abst.dart';
import '../apis/consensus_api.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities [acceptBlock, getSiaFundFee, getState]
/// Author : [CotradeChain]
/// onCreated : 24/05/2023
/// onUpadted : 14/08/2023
/// AuthorCode : James Brel
class ConsensusImpl extends ConsensusAbst {
  /// Note: This Function whose Accepts a mined block. Upon success, the block is forwarded to the node's peers and the whole p2p network like http.Response
  @override
  Future<http.Response> acceptBlock({
    String? username,
    required String password,
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
    required String ipAdress,
  }) async {
    http.Response _response = await http.post(
      Uri.parse(postAcceptBlockApi(ipAdress)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      body: json.encode(
        {
          "ParentID": parentId,
          "Nonce": 0,
          "Timestamp": DateTime.now().toString(),
          "MinerPayouts": [
            {
              "Value": value,
              "Address": address,
            }
          ],
          "Transactions": [
            {
              "SiacoinInputs": [],
              "SiacoinOutputs": [],
              "FileContracts": [],
              "FileContractRevisions": [],
              "StorageProofs": [],
              "SiafundInputs": [],
              "SiafundOutputs": [],
              "MinerFees": [],
              "ArbitraryData": arbitraryDataList,
              "Signatures": []
            }
          ]
        },
      ),
    );
    return _response;
  }

  /// Note: This Function whose Given the total payout of a contract, this endpoint returns the appropriate siafund fee to pay like http.Response
  @override
  Future<http.Response> getSiaFundFee({
    String? username,
    required String password,
    required int payout,
    required String ipAdress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(getTotalPayoutApi(payout, ipAdress)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note: This Function whose Returns some info regarding the current state of the consensus like http.Response
  @override
  Future<http.Response> getState({
    String? username,
    required String password,
    required String ipAdress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(getStateApi(ipAdress)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }
}
