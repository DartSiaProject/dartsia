import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../../../shared/services/cryptography/requests/encrypt_request.dart';
import '../../../../../../shared/services/http/apis/renterd/bus/consensus_api.dart';
import '../../../../../../shared/services/http/requests/http_get_request.dart';
import '../../../../../../shared/services/http/requests/http_post_request.dart';
import '../abstract/consensus_abst.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities [acceptBlock, getSiaFundFee, getState]
/// Author : [CotradeChain]
/// onCreated : 24/05/2023
/// onUpadted : 14/08/2023
/// AuthorCode : James Brel
@LazySingleton(as: ConsensusAbst)
class ConsensusImpl extends ConsensusAbst {
  /// Note: This Function whose Accepts a mined block. Upon success, the block is forwarded to the node's peers and the whole p2p network like var
  @override
  Future<Map<String, dynamic>> acceptBlock({
    // String? username,
    // required String password,
    required String parentId,
    required String address,
    required String value,
    required List<String> arbitraryDataList,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    var _headers = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "content-type": "application/json",
      }),
      key: key,
      iv: iv,
    );
    var _contents = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
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
            "SiacoinInputs": <dynamic>[],
            "SiacoinOutputs": <dynamic>[],
            "FileContracts": <dynamic>[],
            "FileContractRevisions": <dynamic>[],
            "StorageProofs": <dynamic>[],
            "SiafundInputs": <dynamic>[],
            "SiafundOutputs": <dynamic>[],
            "MinerFees": <dynamic>[],
            "ArbitraryData": arbitraryDataList,
            "Signatures": <dynamic>[]
          }
        ]
      }),
      key: key,
      iv: iv,
    );
    var _response = await HttpPostRequest.post<String>(
      api: "$serverAddress${ConsensusApi.postAcceptBlock}",
      // headers: {
      //   HttpHeaders.contentTypeHeader: "application/json",
      //   HttpHeaders.authorizationHeader:
      //       "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      // },
      queryParameters: {
        "header": _headers,
      },
      content: json.encode({
        "data": _contents,
      }),
      // content: json.encode({
      //   "ParentID": parentId,
      //   "Nonce": 0,
      //   "Timestamp": DateTime.now().toString(),
      //   "MinerPayouts": [
      //     {
      //       "Value": value,
      //       "Address": address,
      //     }
      //   ],
      //   "Transactions": [
      //     {
      //       "SiacoinInputs": <dynamic>[],
      //       "SiacoinOutputs": <dynamic>[],
      //       "FileContracts": <dynamic>[],
      //       "FileContractRevisions": <dynamic>[],
      //       "StorageProofs": <dynamic>[],
      //       "SiafundInputs": <dynamic>[],
      //       "SiafundOutputs": <dynamic>[],
      //       "MinerFees": <dynamic>[],
      //       "ArbitraryData": arbitraryDataList,
      //       "Signatures": <dynamic>[]
      //     }
      //   ]
      // }),
    );

    // await http.post(
    //   Uri.parse(ConsensusApi.postAcceptBlock(serverAddress)),
    //   headers: {
    //
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    //   body: json.encode(
    //     {
    //       "ParentID": parentId,
    //       "Nonce": 0,
    //       "Timestamp": DateTime.now().toString(),
    //       "MinerPayouts": [
    //         {
    //           "Value": value,
    //           "Address": address,
    //         }
    //       ],
    //       "Transactions": [
    //         {
    //           "SiacoinInputs": <dynamic>[],
    //           "SiacoinOutputs": <dynamic>[],
    //           "FileContracts": <dynamic>[],
    //           "FileContractRevisions": <dynamic>[],
    //           "StorageProofs": <dynamic>[],
    //           "SiafundInputs": <dynamic>[],
    //           "SiafundOutputs": <dynamic>[],
    //           "MinerFees": <dynamic>[],
    //           "ArbitraryData": arbitraryDataList,
    //           "Signatures": <dynamic>[]
    //         }
    //       ]
    //     },
    //   ),
    // );
    return _response;
  }

  /// Note: This Function whose Given the total payout of a contract, this endpoint returns the appropriate siafund fee to pay like var
  @override
  Future<Map<String, dynamic>> getSiaFundFee({
    // String? username,
    // required String password,
    required int payout,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    var _headers = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "content-type": "application/json",
      }),
      key: key,
      iv: iv,
    );
    var _response = await HttpGetRequest.get<String>(
      api: "$serverAddress${ConsensusApi.getTotalPayout}/$payout",
      // headers: {
      //   HttpHeaders.contentTypeHeader: "application/json",
      //   HttpHeaders.authorizationHeader:
      //       "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      // },
      queryParameters: {
        "header": _headers,
      },
    );

    // await http.get(
    //   Uri.parse(ConsensusApi.getTotalPayout(payout, serverAddress)),
    //   headers: {
    //
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }

  /// Note: This Function whose Returns some info regarding the current state of the consensus like var
  @override
  Future<Map<String, dynamic>> getState({
    // String? username,
    // required String password,
    required String serverAddress,
    required String key,
    required String iv,
  }) async {
    var _headers = EncryptRequest.encryptStringWithAES256CBC(
      data: json.encode({
        "content-type": "application/json",
      }),
      key: key,
      iv: iv,
    );
    var _response = await HttpGetRequest.get<String>(
      api: "$serverAddress${ConsensusApi.getState}",
      // headers: {
      //   HttpHeaders.contentTypeHeader: "application/json",
      //   HttpHeaders.authorizationHeader:
      //       "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      // },
      queryParameters: {
        "header": _headers,
      },
    );

    // await http.get(
    //   Uri.parse(ConsensusApi.getState(serverAddress)),
    //   headers: {
    //
    //     HttpHeaders.authorizationHeader:
    //         "Basic ${base64Encode(utf8.encode('$username:$password'))}"
    //   },
    // );
    return _response;
  }
}
