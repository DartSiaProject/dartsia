import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../../../shared/services/http/apis/renterd/bus/contracts_api.dart';
import '../abstract/contract_abst.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities [acquireAContract, addContract, deleteContractById, getContractById, getContracts, releasePreviousContract]
/// Author : [CotradeChain]
/// onCreated : 24/05/2023
/// onUpadted : 14/08/2023
/// AuthorCode : James Brel
@LazySingleton(as: ContractAbst)
class ContractImpl implements ContractAbst {
  /// Note : This Function whose Acquires a contract for up to a given duration. Similar to ephemeral accounts, contracts can be unlocked ahead of time using the unlock endpoint with the returned lock id like http.Response
  @override
  Future<http.Response> acquireAContract({
    String? username,
    required String password,
    required String id,
    required String duration,
    required int priority,
    required String serverAddress,
  }) async {
    http.Response _response = await http.post(
      Uri.parse(ContractsApi.acquireAContract(id, serverAddress)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      body: json.encode({
        "duration": duration,
        "priority": priority,
      }),
    );
    return _response;
  }

  /// Note : This Function whose Adds a contract to the bus. Usually called by workers after forming a new contract like http.Response
  @override
  Future<http.Response> addContract({
    String? username,
    required String password,
    required String id,
    required Map<dynamic, dynamic> contract,
    required String totalCost,
    required int startHeight,
    required String serverAddress,
  }) async {
    http.Response _response = await http.post(
      Uri.parse(ContractsApi.postContracts(id, serverAddress)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      body: json.encode(
        {
          "contract": contract,
          "startHeight": startHeight,
          "totalCost": totalCost
        },
      ),
    );
    return _response;
  }

  /// Note : This Function whose Deletes a contract from the bus. This doesn't remove the contract from the blockchain. The bus only stops being aware of the contract's existence and will therefore stop using it like http.Response
  @override
  Future<http.Response> deleteContractById({
    String? username,
    required String password,
    required String id,
    required String serverAddress,
  }) async {
    http.Response _response = await http.delete(
      Uri.parse(ContractsApi.deleteContractById(id, serverAddress)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note : This Function whose Returns contract metadata for an active contract with the provided contract id like http.Response
  @override
  Future<http.Response> getContractById({
    String? username,
    required String password,
    required String id,
    required String serverAddress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(ContractsApi.getContractById(id, serverAddress)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note : This Function whose Returns all active contracts the bus is aware of. This includes all contracts that have not expired, have not been renewed and also not manually archived yet. Contracts are also active if they are not part of a contract set like http.Response
  @override
  Future<http.Response> getContracts({
    String? username,
    required String password,
    required String serverAddress,
  }) async {
    http.Response _response = await http.get(
      Uri.parse(ContractsApi.getContracts(serverAddress)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
    );
    return _response;
  }

  /// Note : This function whose Releases a previously acquired contract using the obtained lock id like http.Response
  @override
  Future<http.Response> releasePreviousContract({
    String? username,
    required String password,
    required String id,
    required int lockId,
    required String serverAddress,
  }) async {
    http.Response _response = await http.post(
      Uri.parse(ContractsApi.releasePreviousContract(id, serverAddress)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Basic ${base64Encode(utf8.encode('$username:$password'))}"
      },
      body: json.encode({
        "lockID": lockId,
      }),
    );
    return _response;
  }
}
