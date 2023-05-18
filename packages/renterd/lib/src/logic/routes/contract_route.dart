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
    required String publicKey,
  }) async =>
      await sl<GetContractsController>().call();

  static Future<http.Response> addContract({
    required String id,
    required Map<dynamic, dynamic> contract,
    required String totalCost,
    required int startHeight,
  }) async =>
      await sl<AddContractController>().call(
        id: id,
        contract: contract,
        totalCost: totalCost,
        startHeight: startHeight,
      );

  static Future<http.Response> acquireAContract({
    required String id,
    required String duration,
    required int priority,
  }) async =>
      await sl<AcquireAContractController>().call(
        id: id,
        duration: duration,
        priority: priority,
      );

  static Future<http.Response> releasePreviousContract({
    required String id,
    required int lockId,
  }) async =>
      await sl<ReleasePreviousContractController>().call(
        id: id,
        lockId: lockId,
      );

  static Future<http.Response> getContractById({
    required String id,
  }) async =>
      await sl<GetContractByIdController>().call(
        id: id,
      );

  static Future<http.Response> deleteContractById({
    required String id,
  }) async =>
      await sl<DeleteContractByIdController>().call(
        id: id,
      );
}
