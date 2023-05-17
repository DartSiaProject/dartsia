import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'abstract/accounts_absts/add_deposit_abst.dart';
import 'abstract/accounts_absts/get_all_accounts_abst.dart';
import 'abstract/accounts_absts/get_an_account_by_id_abst.dart';
import 'abstract/accounts_absts/lock_an_account_abst.dart';
import 'abstract/accounts_absts/reset_drift_abst.dart';
import 'abstract/accounts_absts/sync_balance_abst.dart';
import 'abstract/accounts_absts/un_lock_an_account_abst.dart';
import 'abstract/accounts_absts/update_balance_abst.dart';
import 'abstract/consensus_absts/accept_block_abst.dart';
import 'abstract/consensus_absts/get_sia_fund_fee_abst.dart';
import 'abstract/consensus_absts/get_state_abst.dart';
import 'abstract/host_absts/get_allow_list_abst.dart';
import 'abstract/host_absts/get_block_list_abst.dart';
import 'abstract/host_absts/get_host_info_by_public_key_abst.dart';
import 'abstract/host_absts/get_host_scanning_abst.dart';
import 'abstract/host_absts/get_hosts_abst.dart';
import 'abstract/host_absts/post_interaction_abst.dart';
import 'abstract/host_absts/remove_hosts_abst.dart';
import 'abstract/host_absts/update_allow_list_abst.dart';
import 'abstract/host_absts/update_block_list_abst.dart';
import 'data/services/accounts_services/add_deposit_impl.dart';
import 'data/services/accounts_services/get_all_accounts_impl.dart';
import 'data/services/accounts_services/get_an_account_by_id_impl.dart';
import 'data/services/accounts_services/lock_an_account_impl.dart';
import 'data/services/accounts_services/reset_drift_impl.dart';
import 'data/services/accounts_services/sync_balance_impl.dart';
import 'data/services/accounts_services/un_lock_an_account_impl.dart';
import 'data/services/accounts_services/update_balance_impl.dart';
import 'data/services/consensus_services/accept_block_impl.dart';
import 'data/services/consensus_services/get_sia_fund_fee_impl.dart';
import 'data/services/consensus_services/get_state_impl.dart';
import 'data/services/host_services/get_allow_list_impl.dart';
import 'data/services/host_services/get_block_list_impl.dart';
import 'data/services/host_services/get_host_info_by_public_key_impl.dart';
import 'data/services/host_services/get_host_scanning_impl.dart';
import 'data/services/host_services/get_hosts_impl.dart';
import 'data/services/host_services/post_interaction_impl.dart';
import 'data/services/host_services/remove_hosts_impl.dart';
import 'data/services/host_services/update_allow_list_impl.dart';
import 'data/services/host_services/update_block_list_impl.dart';
import 'logic/controllers/accounts_controllers/add_deposit_controller.dart';
import 'logic/controllers/accounts_controllers/get_all_accounts_controller.dart';
import 'logic/controllers/accounts_controllers/get_an_account_by_id_controller.dart';
import 'logic/controllers/accounts_controllers/lock_an_account_controller.dart';
import 'logic/controllers/accounts_controllers/reset_drift_controller.dart';
import 'logic/controllers/accounts_controllers/sync_balance_controller.dart';
import 'logic/controllers/accounts_controllers/un_lock_an_account_controller.dart';
import 'logic/controllers/accounts_controllers/update_balance_controller.dart';
import 'logic/controllers/consensus_controllers/accept_block_controller.dart';
import 'logic/controllers/consensus_controllers/get_sia_fund_fee_controller.dart';
import 'logic/controllers/consensus_controllers/get_state_controller.dart';
import 'logic/controllers/host_controllers/get_allow_list_controller.dart';
import 'logic/controllers/host_controllers/get_block_list_controller.dart';
import 'logic/controllers/host_controllers/get_host_info_by_public_key_controller.dart';
import 'logic/controllers/host_controllers/get_host_scanning_controller.dart';
import 'logic/controllers/host_controllers/get_hosts_controller.dart';
import 'logic/controllers/host_controllers/post_interaction_controller.dart';
import 'logic/controllers/host_controllers/remove_hosts_controller.dart';
import 'logic/controllers/host_controllers/update_allow_list_controller.dart';
import 'logic/controllers/host_controllers/update_block_list_controller.dart';

final sl = GetIt.instance;

Future<void> initialization() async {
  await dotenv.load(fileName: "assets/envs/.env");

  sl.registerLazySingleton<GetAllAccountsAbst>(() => GetAllAccountsImpl());
  sl.registerLazySingleton<GetAnAccountByIdAbst>(() => GetAnAccountByIdImpl());
  sl.registerLazySingleton<LockAnAccountAbst>(() => LockAnAccountImpl());
  sl.registerLazySingleton<UnLockAnAccountAbst>(() => UnLockAnAccountImpl());
  sl.registerLazySingleton<AddDepositAbst>(() => AddDepositImpl());
  sl.registerLazySingleton<UpdateBalanceAbst>(() => UpdateBalanceImpl());
  sl.registerLazySingleton<SyncBalanceAbst>(() => SyncBalanceImpl());
  sl.registerLazySingleton<ResetDriftAbst>(() => ResetDriftImpl());
  sl.registerLazySingleton<AcceptBlockAbst>(() => AcceptBlockImpl());
  sl.registerLazySingleton<GetStateAbst>(() => GetStateImpl());
  sl.registerLazySingleton<GetSiaFundFeeAbst>(() => GetSiaFundFeeImpl());
  sl.registerLazySingleton<GetHostInfoByPublicKeyAbst>(
      () => GetHostInfoByPublicKeyImpl());
  sl.registerLazySingleton<GetHostsAbst>(() => GetHostsImpl());
  sl.registerLazySingleton<UpdateAllowListAbst>(() => UpdateAllowListImpl());
  sl.registerLazySingleton<UpdateBlockListAbst>(() => UpdateBlockListImpl());
  sl.registerLazySingleton<GetAllowListAbst>(() => GetAllowListImpl());
  sl.registerLazySingleton<GetBlockListAbst>(() => GetBlockListImpl());
  sl.registerLazySingleton<PostInteractionAbst>(() => PostInteractionImpl());
  sl.registerLazySingleton<RemoveHostsAbst>(() => RemoveHostsImpl());
  sl.registerLazySingleton<GetHostScannigAbst>(() => GetHostScannigImpl());

//! Controller

  sl.registerFactory<GetAllAccountsController>(
      () => GetAllAccountsController(getAllAccountsAbst: sl.call()));
  sl.registerFactory<GetAnAccountByIdController>(
      () => GetAnAccountByIdController(getAnAccountByIdAbst: sl.call()));
  sl.registerFactory<LockAnAccountController>(
      () => LockAnAccountController(lockAnAccountAbst: sl.call()));
  sl.registerFactory<UnLockAnAccountController>(
      () => UnLockAnAccountController(unLockAnAccountAbst: sl.call()));
  sl.registerFactory<AddDepositController>(
      () => AddDepositController(addDepositAbst: sl.call()));
  sl.registerFactory<UpdateBalanceController>(
      () => UpdateBalanceController(updateBalanceAbst: sl.call()));
  sl.registerFactory<SyncBalanceController>(
      () => SyncBalanceController(syncBalanceAbst: sl.call()));
  sl.registerFactory<ResetDriftController>(
      () => ResetDriftController(resetDriftAbst: sl.call()));
  sl.registerFactory<AcceptBlockController>(
      () => AcceptBlockController(acceptBlockAbst: sl.call()));
  sl.registerFactory<GetStateController>(
      () => GetStateController(getStateAbst: sl.call()));
  sl.registerFactory<GetSiaFundFeeController>(
      () => GetSiaFundFeeController(getSiaFundFeeAbst: sl.call()));
  sl.registerFactory<GetHostInfoByPublicKeyController>(
      () => GetHostInfoByPublicKeyController(
            getHostInfoByPublicKeyAbst: sl.call(),
          ));
  sl.registerFactory<GetHostsController>(() => GetHostsController(
        getHostsAbst: sl.call(),
      ));
  sl.registerFactory<UpdateAllowListController>(() => UpdateAllowListController(
        updateAllowListAbst: sl.call(),
      ));
  sl.registerFactory<UpdateBlockListController>(() => UpdateBlockListController(
        updateBlockListAbst: sl.call(),
      ));
  sl.registerFactory<GetAllowListController>(() => GetAllowListController(
        getAllowListAbst: sl.call(),
      ));
  sl.registerFactory<GetBlockListController>(() => GetBlockListController(
        getBlockListAbst: sl.call(),
      ));
  sl.registerFactory<PostInteractionController>(() => PostInteractionController(
        postInteractionAbst: sl.call(),
      ));
  sl.registerFactory<RemoveHostsController>(() => RemoveHostsController(
        removeHostsAbst: sl.call(),
      ));
  sl.registerFactory<GetHostScannigController>(() => GetHostScannigController(
        getHostScannigAbst: sl.call(),
      ));
}
