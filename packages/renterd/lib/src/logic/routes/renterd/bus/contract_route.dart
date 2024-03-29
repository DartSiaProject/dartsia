import 'package:http/http.dart' as http;

import '../../../../injection.dart';
import '../../../controllers/renterd/bus/contract_controllers/acquire_a_contract_controller.dart';
import '../../../controllers/renterd/bus/contract_controllers/add_contract_controller.dart';
import '../../../controllers/renterd/bus/contract_controllers/delete_contract_by_id_controller.dart';
import '../../../controllers/renterd/bus/contract_controllers/get_contract_by_id_controller.dart';
import '../../../controllers/renterd/bus/contract_controllers/get_contracts_controller.dart';
import '../../../controllers/renterd/bus/contract_controllers/release_presious_contract_controller.dart';

class Contract {
  static Future<http.Response> getContracts({
    String? username,
    required String password,
    required String serverAddress,
  }) async =>
      await Renterd.sl<GetContractsController>().call(
        username: username,
        password: password,
        serverAddress: serverAddress,
      );

  static Future<http.Response> addContract({
    String? username,
    required String password,
    required String id,
    required Map<dynamic, dynamic> contract,
    required String totalCost,
    required int startHeight,
    required String serverAddress,
  }) async =>
      await Renterd.sl<AddContractController>().call(
        username: username,
        password: password,
        id: id,
        contract: contract,
        totalCost: totalCost,
        startHeight: startHeight,
        serverAddress: serverAddress,
      );

  static Future<http.Response> acquireAContract({
    String? username,
    required String password,
    required String id,
    required String duration,
    required int priority,
    required String serverAddress,
  }) async =>
      await Renterd.sl<AcquireAContractController>().call(
        username: username,
        password: password,
        id: id,
        duration: duration,
        priority: priority,
        serverAddress: serverAddress,
      );

  static Future<http.Response> releasePreviousContract({
    String? username,
    required String password,
    required String id,
    required int lockId,
    required String serverAddress,
  }) async =>
      await Renterd.sl<ReleasePreviousContractController>().call(
        username: username,
        password: password,
        id: id,
        lockId: lockId,
        serverAddress: serverAddress,
      );

  static Future<http.Response> getContractById({
    String? username,
    required String password,
    required String id,
    required String serverAddress,
  }) async =>
      await Renterd.sl<GetContractByIdController>().call(
        username: username,
        password: password,
        id: id,
        serverAddress: serverAddress,
      );

  static Future<http.Response> deleteContractById({
    String? username,
    required String password,
    required String id,
    required String serverAddress,
  }) async =>
      await Renterd.sl<DeleteContractByIdController>().call(
        username: username,
        password: password,
        id: id,
        serverAddress: serverAddress,
      );
}
