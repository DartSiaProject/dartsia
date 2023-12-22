import 'package:http/http.dart' as http;

import '../../../../injection.dart';
import '../../../controllers/renterd/bus/accounts_controllers/add_deposit_controller.dart';
import '../../../controllers/renterd/bus/accounts_controllers/get_all_accounts_controller.dart';
import '../../../controllers/renterd/bus/accounts_controllers/get_an_account_by_id_controller.dart';
import '../../../controllers/renterd/bus/accounts_controllers/lock_an_account_controller.dart';
import '../../../controllers/renterd/bus/accounts_controllers/reset_drift_controller.dart';
import '../../../controllers/renterd/bus/accounts_controllers/sync_balance_controller.dart';
import '../../../controllers/renterd/bus/accounts_controllers/un_lock_an_account_controller.dart';
import '../../../controllers/renterd/bus/accounts_controllers/update_balance_controller.dart';

class Accounts {
  static Future<http.Response> getAllAccounts({
    String? username,
    required String password,
    required String serverAddress,
  }) async =>
      await Renterd.sl<GetAllAccountsController>().call(
        password: password,
        username: username,
        serverAddress: serverAddress,
      );

  static Future<http.Response> getAnAcountById({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required String serverAddress,
  }) async =>
      await Renterd.sl<GetAnAccountByIdController>().call(
        username: username,
        password: password,
        accountId: accountId,
        hostKey: hostKey,
        serverAddress: serverAddress,
      );

  static Future<http.Response> lockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String hostKey,
    required bool exclusive,
    required String serverAddress,
  }) async =>
      await Renterd.sl<LockAnAccountController>().call(
        username: username,
        password: password,
        accountId: accountId,
        hostKey: hostKey,
        exclusive: exclusive,
        serverAddress: serverAddress,
      );

  static Future<http.Response> unLockAnAccount({
    String? username,
    required String password,
    required String accountId,
    required String lockId,
    required String serverAddress,
  }) async =>
      await Renterd.sl<UnLockAnAccountController>().call(
        username: username,
        password: password,
        accountId: accountId,
        lockId: lockId,
        serverAddress: serverAddress,
      );

  static Future<http.Response> addDeposit({
    String? username,
    required String password,
    required String accountId,
    required int amount,
    required String host,
    required String serverAddress,
  }) async =>
      await Renterd.sl<AddDepositController>().call(
        username: username,
        password: password,
        accountId: accountId,
        amount: amount,
        host: host,
        serverAddress: serverAddress,
      );

  static Future<http.Response> updateBalance({
    String? username,
    required String password,
    required String accountId,
    required int amount,
    required String host,
    required String serverAddress,
  }) async =>
      await Renterd.sl<UpdateBalanceController>().call(
        username: username,
        password: password,
        accountId: accountId,
        amount: amount,
        host: host,
        serverAddress: serverAddress,
      );

  static Future<http.Response> syncBalance({
    String? username,
    required String password,
    required String accountId,
    required String host,
    required String serverAddress,
  }) async =>
      await Renterd.sl<SyncBalanceController>().call(
        username: username,
        password: password,
        accountId: accountId,
        host: host,
        serverAddress: serverAddress,
      );

  static Future<http.Response> resetDrift({
    String? username,
    required String password,
    required String accountId,
    required String serverAddress,
  }) async =>
      await Renterd.sl<ResetDriftController>().call(
        username: username,
        password: password,
        accountId: accountId,
        serverAddress: serverAddress,
      );
}
