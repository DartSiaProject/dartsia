import '../../../core/configs/injectors_config/injector.dart';
import '../features/bus/controllers/accounts_controllers/add_deposit_controller.dart';
import '../features/bus/controllers/accounts_controllers/get_all_accounts_controller.dart';
import '../features/bus/controllers/accounts_controllers/get_an_account_by_id_controller.dart';
import '../features/bus/controllers/accounts_controllers/lock_an_account_controller.dart';
import '../features/bus/controllers/accounts_controllers/reset_drift_controller.dart';
import '../features/bus/controllers/accounts_controllers/sync_balance_controller.dart';
import '../features/bus/controllers/accounts_controllers/un_lock_an_account_controller.dart';
import '../features/bus/controllers/accounts_controllers/update_balance_controller.dart';

class Accounts {
  static Future<Map<String, dynamic>> getAllAccounts({
    String? username,
    required String password,
    required String serverAddress,
  }) async =>
      await sl<GetAllAccountsController>().call(
        password: password,
        username: username,
        serverAddress: serverAddress,
      );

  static Future<Map<String, dynamic>> getAnAcountById({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required String serverAddress,
  }) async =>
      await sl<GetAnAccountByIdController>().call(
        username: username,
        password: password,
        accountId: accountId,
        hostKey: hostKey,
        serverAddress: serverAddress,
      );

  static Future<Map<String, dynamic>> lockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required bool exclusive,
    required String serverAddress,
  }) async =>
      await sl<LockAnAccountController>().call(
        username: username,
        password: password,
        accountId: accountId,
        hostKey: hostKey,
        exclusive: exclusive,
        serverAddress: serverAddress,
      );

  static Future<Map<String, dynamic>> unLockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String lockId,
    required String serverAddress,
  }) async =>
      await sl<UnLockAnAccountController>().call(
        username: username,
        password: password,
        accountId: accountId,
        lockId: lockId,
        serverAddress: serverAddress,
      );

  static Future<Map<String, dynamic>> addDeposit({
    String? username,
    required String password,
    required String accountId,
    required int amount,
    required String host,
    required String serverAddress,
  }) async =>
      await sl<AddDepositController>().call(
        username: username,
        password: password,
        accountId: accountId,
        amount: amount,
        host: host,
        serverAddress: serverAddress,
      );

  static Future<Map<String, dynamic>> updateBalance({
    String? username,
    required String password,
    required String accountId,
    required int amount,
    required String host,
    required String serverAddress,
  }) async =>
      await sl<UpdateBalanceController>().call(
        username: username,
        password: password,
        accountId: accountId,
        amount: amount,
        host: host,
        serverAddress: serverAddress,
      );

  static Future<Map<String, dynamic>> syncBalance({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required String serverAddress,
  }) async =>
      await sl<SyncBalanceController>().call(
        username: username,
        password: password,
        accountId: accountId,
        host: host,
        serverAddress: serverAddress,
      );

  static Future<Map<String, dynamic>> resetDrift({
    String? username,
    required String password,
    required String accountId,
    required String serverAddress,
  }) async =>
      await sl<ResetDriftController>().call(
        username: username,
        password: password,
        accountId: accountId,
        serverAddress: serverAddress,
      );
}
