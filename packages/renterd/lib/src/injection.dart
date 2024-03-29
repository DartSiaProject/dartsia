import 'package:get_it/get_it.dart';

import 'abstract/renterd/bus/accounts_abst.dart';
import 'abstract/renterd/bus/consensus_abst.dart';
import 'abstract/renterd/bus/contract_abst.dart';
import 'abstract/renterd/bus/hoster_abst.dart';
import 'logic/controllers/renterd/bus/accounts_controllers/add_deposit_controller.dart';
import 'logic/controllers/renterd/bus/accounts_controllers/get_all_accounts_controller.dart';
import 'logic/controllers/renterd/bus/accounts_controllers/get_an_account_by_id_controller.dart';
import 'logic/controllers/renterd/bus/accounts_controllers/lock_an_account_controller.dart';
import 'logic/controllers/renterd/bus/accounts_controllers/reset_drift_controller.dart';
import 'logic/controllers/renterd/bus/accounts_controllers/sync_balance_controller.dart';
import 'logic/controllers/renterd/bus/accounts_controllers/un_lock_an_account_controller.dart';
import 'logic/controllers/renterd/bus/accounts_controllers/update_balance_controller.dart';
import 'logic/controllers/renterd/bus/consensus_controllers/accept_block_controller.dart';
import 'logic/controllers/renterd/bus/consensus_controllers/get_sia_fund_fee_controller.dart';
import 'logic/controllers/renterd/bus/consensus_controllers/get_state_controller.dart';
import 'logic/controllers/renterd/bus/contract_controllers/acquire_a_contract_controller.dart';
import 'logic/controllers/renterd/bus/contract_controllers/add_contract_controller.dart';
import 'logic/controllers/renterd/bus/contract_controllers/delete_contract_by_id_controller.dart';
import 'logic/controllers/renterd/bus/contract_controllers/get_contract_by_id_controller.dart';
import 'logic/controllers/renterd/bus/contract_controllers/get_contracts_controller.dart';
import 'logic/controllers/renterd/bus/contract_controllers/release_presious_contract_controller.dart';
import 'logic/controllers/renterd/bus/hoster_controllers/fetch_some_host_controller.dart';
import 'logic/controllers/renterd/bus/hoster_controllers/get_allow_list_controller.dart';
import 'logic/controllers/renterd/bus/hoster_controllers/get_block_list_controller.dart';
import 'logic/controllers/renterd/bus/hoster_controllers/get_host_info_by_public_key_controller.dart';
import 'logic/controllers/renterd/bus/hoster_controllers/get_host_scanning_controller.dart';
import 'logic/controllers/renterd/bus/hoster_controllers/get_hosts_controller.dart';
import 'logic/controllers/renterd/bus/hoster_controllers/post_interaction_controller.dart';
import 'logic/controllers/renterd/bus/hoster_controllers/remove_hosts_controller.dart';
import 'logic/controllers/renterd/bus/hoster_controllers/update_allow_list_controller.dart';
import 'logic/controllers/renterd/bus/hoster_controllers/update_block_list_controller.dart';
import 'logic/controllers/renterd/bus/hoster_controllers/update_some_host_controller.dart';
import 'services/renterd/bus/accounts_impl.dart';
import 'services/renterd/bus/consensus_impl.dart';
import 'services/renterd/bus/contract_impl.dart';
import 'services/renterd/bus/hoster_impl.dart';

class Renterd {
  static var sl = GetIt.instance;
  static void init() {
    sl.registerLazySingleton<AccountsAbst>(() => AccountsImpl());
    sl.registerLazySingleton<ConsensusAbst>(() => ConsensusImpl());
    sl.registerLazySingleton<HosterAbst>(() => HosterImpl());
    sl.registerLazySingleton<ContractAbst>(() => ContractImpl());

    sl.registerFactory<GetAllAccountsController>(
        () => GetAllAccountsController(accountsAbst: sl.call()));
    sl.registerFactory<GetAnAccountByIdController>(
        () => GetAnAccountByIdController(accountsAbst: sl.call()));
    sl.registerFactory<LockAnAccountController>(
        () => LockAnAccountController(accountsAbst: sl.call()));
    sl.registerFactory<UnLockAnAccountController>(
        () => UnLockAnAccountController(accountsAbst: sl.call()));
    sl.registerFactory<AddDepositController>(
        () => AddDepositController(accountsAbst: sl.call()));
    sl.registerFactory<UpdateBalanceController>(
        () => UpdateBalanceController(accountsAbst: sl.call()));
    sl.registerFactory<SyncBalanceController>(
        () => SyncBalanceController(accountsAbst: sl.call()));
    sl.registerFactory<ResetDriftController>(
        () => ResetDriftController(accountsAbst: sl.call()));
    sl.registerFactory<AcceptBlockController>(
        () => AcceptBlockController(consensusAbst: sl.call()));
    sl.registerFactory<GetStateController>(
        () => GetStateController(consensusAbst: sl.call()));
    sl.registerFactory<GetSiaFundFeeController>(
        () => GetSiaFundFeeController(consensusAbst: sl.call()));
    sl.registerFactory<GetHostInfoByPublicKeyController>(
        () => GetHostInfoByPublicKeyController(hosterAbst: sl.call()));
    sl.registerFactory<GetHostsController>(
        () => GetHostsController(hosterAbst: sl.call()));
    sl.registerFactory<UpdateAllowListController>(
        () => UpdateAllowListController(hosterAbst: sl.call()));
    sl.registerFactory<UpdateBlockListController>(
        () => UpdateBlockListController(hosterAbst: sl.call()));
    sl.registerFactory<GetAllowListController>(
        () => GetAllowListController(hosterAbst: sl.call()));
    sl.registerFactory<GetBlockListController>(
        () => GetBlockListController(hosterAbst: sl.call()));
    sl.registerFactory<PostInteractionController>(
        () => PostInteractionController(hosterAbst: sl.call()));
    sl.registerFactory<RemoveHostsController>(
        () => RemoveHostsController(hosterAbst: sl.call()));
    sl.registerFactory<GetHostScannigController>(
        () => GetHostScannigController(hosterAbst: sl.call()));
    sl.registerFactory<GetContractsController>(
        () => GetContractsController(contractAbst: sl.call()));
    sl.registerFactory<AddContractController>(
        () => AddContractController(contractAbst: sl.call()));
    sl.registerFactory<AcquireAContractController>(
        () => AcquireAContractController(contractAbst: sl.call()));
    sl.registerFactory<ReleasePreviousContractController>(
        () => ReleasePreviousContractController(contractAbst: sl.call()));
    sl.registerFactory<GetContractByIdController>(
        () => GetContractByIdController(contractAbst: sl.call()));
    sl.registerFactory<DeleteContractByIdController>(
        () => DeleteContractByIdController(contractAbst: sl.call()));
    sl.registerFactory<FetchSomeHostController>(
        () => FetchSomeHostController(hosterAbst: sl.call()));
    sl.registerFactory<UpdateSomeHostController>(
        () => UpdateSomeHostController(hosterAbst: sl.call()));
  }
}
