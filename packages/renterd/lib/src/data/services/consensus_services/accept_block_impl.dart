import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../abstract/consensus_absts/accept_block_abst.dart';
import '../../../apis/consensus_api.dart';

/// Project : Renterd's Package
/// Description : This file contains the function [accept Block] whose Accepts a mined block. Upon success, the block is forwarded to the node's peers and the whole p2p network.into response"
/// Author : James Brel
/// onCreated : 17/05/2023
/// onUpadted : #
/// Upadted by : #
class AcceptBlockImpl implements AcceptBlockAbst {
  @override
  Future<http.Response> acceptBlock({
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
  }) async {
    http.Response _response = await http.post(
      Uri.parse("${dotenv.env['ROOT_URL']}$postAcceptBlockApi"),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: json.encode(
        {
          "ParentID": parentId,
          "Nonce": 0,
          "Timestamp": DateTime.now(),
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
}
