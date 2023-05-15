import 'package:http/http.dart' as http;

import '../../injection.dart';
import '../controllers/accounts_controllers/add_deposit_controller.dart';
import '../controllers/accounts_controllers/get_all_accounts_controller.dart';
import '../controllers/accounts_controllers/get_an_account_by_id_controller.dart';
import '../controllers/accounts_controllers/lock_an_account_controller.dart';
import '../controllers/accounts_controllers/reset_drift_controller.dart';
import '../controllers/accounts_controllers/sync_balance_controller.dart';
import '../controllers/accounts_controllers/un_lock_an_account_controller.dart';
import '../controllers/accounts_controllers/update_balance_controller.dart';

class Accounts {
  static Future<http.Response> getAllAccounts() async =>
      await sl<GetAllAccountsController>().call();

  static Future<http.Response> getAnAcountById({
    required String accountId,
    required String hostKey,
  }) async =>
      await sl<GetAnAccountByIdController>().call(
        accountId: accountId,
        hostKey: hostKey,
      );

  static Future<http.Response> lockAnAccount({
    required String accountId,
    required String hostKey,
    required bool exclusive,
  }) async =>
      await sl<LockAnAccountController>().call(
        accountId: accountId,
        hostKey: hostKey,
        exclusive: exclusive,
      );

  static Future<http.Response> unLockAnAccount({
    required String accountId,
    required int lockId,
  }) async =>
      await sl<UnLockAnAccountController>().call(
        accountId: accountId,
        lockId: lockId,
      );

  static Future<http.Response> addDeposit({
    required String accountId,
    required int amount,
    required String host,
  }) async =>
      await sl<AddDepositController>().call(
        accountId: accountId,
        amount: amount,
        host: host,
      );

  static Future<http.Response> updateBalance({
    required String accountId,
    required int amount,
    required String host,
  }) async =>
      await sl<UpdateBalanceController>().call(
        accountId: accountId,
        amount: amount,
        host: host,
      );

  static Future<http.Response> syncBalance({
    required String accountId,
    required String host,
  }) async =>
      await sl<SyncBalanceController>().call(
        accountId: accountId,
        host: host,
      );

  static Future<http.Response> resetDrift({
    required String accountId,
    required int amount,
    required String host,
  }) async =>
      await sl<ResetDriftController>().call(
        accountId: accountId,
        amount: amount,
        host: host,
      );
}
