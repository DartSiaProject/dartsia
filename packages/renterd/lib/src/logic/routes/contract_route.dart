import 'package:http/http.dart' as http;

import '../../injection.dart';
import '../controllers/contract_controllers/acquire_a_contract_controller.dart';
import '../controllers/contract_controllers/add_contract_controller.dart';
import '../controllers/contract_controllers/delete_contract_by_id_controller.dart';
import '../controllers/contract_controllers/get_contract_by_id_controller.dart';
import '../controllers/contract_controllers/get_contracts_controller.dart';
import '../controllers/contract_controllers/release_presious_contract_controller.dart';

class Contract {
  static Future<http.Response> getContracts({
    String? username,
    required String password,
    required String ipAdress,
  }) async =>
      await sl<GetContractsController>().call(
        username: username,
        password: password,
        ipAdress: ipAdress,
      );

  static Future<http.Response> addContract({
    String? username,
    required String password,
    required String id,
    required Map<dynamic, dynamic> contract,
    required String totalCost,
    required int startHeight,
    required String ipAdress,
  }) async =>
      await sl<AddContractController>().call(
        username: username,
        password: password,
        id: id,
        contract: contract,
        totalCost: totalCost,
        startHeight: startHeight,
        ipAdress: ipAdress,
      );

  static Future<http.Response> acquireAContract({
    String? username,
    required String password,
    required String id,
    required String duration,
    required int priority,
    required String ipAdress,
  }) async =>
      await sl<AcquireAContractController>().call(
        username: username,
        password: password,
        id: id,
        duration: duration,
        priority: priority,
        ipAdress: ipAdress,
      );

  static Future<http.Response> releasePreviousContract({
    String? username,
    required String password,
    required String id,
    required int lockId,
    required String ipAdress,
  }) async =>
      await sl<ReleasePreviousContractController>().call(
        username: username,
        password: password,
        id: id,
        lockId: lockId,
        ipAdress: ipAdress,
      );

  static Future<http.Response> getContractById({
    String? username,
    required String password,
    required String id,
    required String ipAdress,
  }) async =>
      await sl<GetContractByIdController>().call(
        username: username,
        password: password,
        id: id,
        ipAdress: ipAdress,
      );

  static Future<http.Response> deleteContractById({
    String? username,
    required String password,
    required String id,
    required String ipAdress,
  }) async =>
      await sl<DeleteContractByIdController>().call(
        username: username,
        password: password,
        id: id,
        ipAdress: ipAdress,
      );
}
