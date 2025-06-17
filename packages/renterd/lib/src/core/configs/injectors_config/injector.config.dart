// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../modules/crypto_mod/features/generate_key/controllers/crypto_controllers/generate_key_controller.dart'
    as _i979;
import '../../../modules/crypto_mod/features/generate_key/data/abst/generate_the_key_abst.dart'
    as _i250;
import '../../../modules/crypto_mod/features/generate_key/data/impls/generate_the_key_impl.dart'
    as _i956;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/add_deposit_controller.dart'
    as _i739;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/get_all_accounts_controller.dart'
    as _i618;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/get_an_account_by_id_controller.dart'
    as _i562;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/lock_an_account_controller.dart'
    as _i470;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/reset_drift_controller.dart'
    as _i218;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/sync_balance_controller.dart'
    as _i216;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/un_lock_an_account_controller.dart'
    as _i181;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/update_balance_controller.dart'
    as _i249;
import '../../../modules/renterd_mod/features/bus/controllers/consensus_controllers/accept_block_controller.dart'
    as _i442;
import '../../../modules/renterd_mod/features/bus/controllers/consensus_controllers/get_sia_fund_fee_controller.dart'
    as _i514;
import '../../../modules/renterd_mod/features/bus/controllers/consensus_controllers/get_state_controller.dart'
    as _i1047;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/acquire_a_contract_controller.dart'
    as _i728;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/add_contract_controller.dart'
    as _i635;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/delete_contract_by_id_controller.dart'
    as _i329;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/get_contract_by_id_controller.dart'
    as _i895;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/get_contracts_controller.dart'
    as _i443;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/release_presious_contract_controller.dart'
    as _i259;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/fetch_some_host_controller.dart'
    as _i914;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_allow_list_controller.dart'
    as _i546;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_block_list_controller.dart'
    as _i612;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_host_info_by_public_key_controller.dart'
    as _i293;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_host_scanning_controller.dart'
    as _i523;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_hosts_controller.dart'
    as _i325;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/post_interaction_controller.dart'
    as _i1067;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/remove_hosts_controller.dart'
    as _i287;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/update_allow_list_controller.dart'
    as _i842;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/update_block_list_controller.dart'
    as _i531;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/update_some_host_controller.dart'
    as _i263;
import '../../../modules/renterd_mod/features/bus/controllers/notifications_controller/dismiss_notifications_controller.dart'
    as _i975;
import '../../../modules/renterd_mod/features/bus/controllers/notifications_controller/find_notifications_controller.dart'
    as _i233;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/copy_and_paste_the_object_controller.dart'
    as _i130;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/delete_the_object_controller.dart'
    as _i553;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/get_details_of_object_controller.dart'
    as _i242;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/get_the_list_of_bucket_controller.dart'
    as _i880;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/get_the_list_of_object_controller.dart'
    as _i293;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/rename_an_object_controller.dart'
    as _i1024;
import '../../../modules/renterd_mod/features/bus/data/abstract/accounts_abst.dart'
    as _i968;
import '../../../modules/renterd_mod/features/bus/data/abstract/consensus_abst.dart'
    as _i420;
import '../../../modules/renterd_mod/features/bus/data/abstract/contract_abst.dart'
    as _i642;
import '../../../modules/renterd_mod/features/bus/data/abstract/hoster_abst.dart'
    as _i575;
import '../../../modules/renterd_mod/features/bus/data/abstract/notification_abst.dart'
    as _i720;
import '../../../modules/renterd_mod/features/bus/data/abstract/object_abst.dart'
    as _i820;
import '../../../modules/renterd_mod/features/bus/data/impls/accounts_impl.dart'
    as _i45;
import '../../../modules/renterd_mod/features/bus/data/impls/consensus_impl.dart'
    as _i902;
import '../../../modules/renterd_mod/features/bus/data/impls/contract_impl.dart'
    as _i90;
import '../../../modules/renterd_mod/features/bus/data/impls/hoster_impl.dart'
    as _i423;
import '../../../modules/renterd_mod/features/bus/data/impls/notification_impl.dart'
    as _i639;
import '../../../modules/renterd_mod/features/bus/data/impls/object_impl.dart'
    as _i468;
import '../../../modules/renterd_mod/features/worker/controllers/object_controllers/download_the_object_controller.dart'
    as _i752;
import '../../../modules/renterd_mod/features/worker/controllers/object_controllers/upload_the_object_controller.dart'
    as _i13;
import '../../../modules/renterd_mod/features/worker/data/abstract/worker_object_abst.dart'
    as _i451;
import '../../../modules/renterd_mod/features/worker/data/impls/worker_object_impl.dart'
    as _i667;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i420.ConsensusAbst>(() => _i902.ConsensusImpl());
    gh.lazySingleton<_i250.GenerateTheKeyAbst>(
        () => _i956.GenerateTheKeyImpl());
    gh.lazySingleton<_i451.WorkerObjectAbst>(() => _i667.WorkerObjectImpl());
    gh.lazySingleton<_i968.AccountsAbst>(() => _i45.AccountsImpl());
    gh.lazySingleton<_i820.ObjectAbst>(() => _i468.ObjectImpl());
    gh.lazySingleton<_i720.NotificationAbst>(() => _i639.NotificationImpl());
    gh.factory<_i752.DownloadTheObjectController>(() =>
        _i752.DownloadTheObjectController(
            workerObjectAbst: gh<_i451.WorkerObjectAbst>()));
    gh.factory<_i13.UploadTheObjectController>(() =>
        _i13.UploadTheObjectController(
            workerObjectAbst: gh<_i451.WorkerObjectAbst>()));
    gh.factory<_i1047.GetStateController>(() =>
        _i1047.GetStateController(consensusAbst: gh<_i420.ConsensusAbst>()));
    gh.factory<_i442.AcceptBlockController>(() =>
        _i442.AcceptBlockController(consensusAbst: gh<_i420.ConsensusAbst>()));
    gh.factory<_i514.GetSiaFundFeeController>(() =>
        _i514.GetSiaFundFeeController(
            consensusAbst: gh<_i420.ConsensusAbst>()));
    gh.lazySingleton<_i575.HosterAbst>(() => _i423.HosterImpl());
    gh.factory<_i979.GenerateKeyController>(() => _i979.GenerateKeyController(
        generateTheKeyAbst: gh<_i250.GenerateTheKeyAbst>()));
    gh.lazySingleton<_i642.ContractAbst>(() => _i90.ContractImpl());
    gh.factory<_i470.LockAnAccountController>(() =>
        _i470.LockAnAccountController(accountsAbst: gh<_i968.AccountsAbst>()));
    gh.factory<_i216.SyncBalanceController>(() =>
        _i216.SyncBalanceController(accountsAbst: gh<_i968.AccountsAbst>()));
    gh.factory<_i218.ResetDriftController>(() =>
        _i218.ResetDriftController(accountsAbst: gh<_i968.AccountsAbst>()));
    gh.factory<_i562.GetAnAccountByIdController>(() =>
        _i562.GetAnAccountByIdController(
            accountsAbst: gh<_i968.AccountsAbst>()));
    gh.factory<_i618.GetAllAccountsController>(() =>
        _i618.GetAllAccountsController(accountsAbst: gh<_i968.AccountsAbst>()));
    gh.factory<_i739.AddDepositController>(() =>
        _i739.AddDepositController(accountsAbst: gh<_i968.AccountsAbst>()));
    gh.factory<_i181.UnLockAnAccountController>(() =>
        _i181.UnLockAnAccountController(
            accountsAbst: gh<_i968.AccountsAbst>()));
    gh.factory<_i249.UpdateBalanceController>(() =>
        _i249.UpdateBalanceController(accountsAbst: gh<_i968.AccountsAbst>()));
    gh.factory<_i233.FindNotificationsController>(() =>
        _i233.FindNotificationsController(
            notificationAbst: gh<_i720.NotificationAbst>()));
    gh.factory<_i975.DismissNotificationsController>(() =>
        _i975.DismissNotificationsController(
            notificationAbst: gh<_i720.NotificationAbst>()));
    gh.factory<_i293.GetTheListOfObjectController>(() =>
        _i293.GetTheListOfObjectController(objectAbst: gh<_i820.ObjectAbst>()));
    gh.factory<_i880.GetTheListOfBucketController>(() =>
        _i880.GetTheListOfBucketController(objectAbst: gh<_i820.ObjectAbst>()));
    gh.factory<_i1024.RenameAnObjectController>(() =>
        _i1024.RenameAnObjectController(objectAbst: gh<_i820.ObjectAbst>()));
    gh.factory<_i553.DeleteTheObjectController>(() =>
        _i553.DeleteTheObjectController(objectAbst: gh<_i820.ObjectAbst>()));
    gh.factory<_i242.GetTheDetailsOfObjectController>(() =>
        _i242.GetTheDetailsOfObjectController(
            objectAbst: gh<_i820.ObjectAbst>()));
    gh.factory<_i130.CopyAndPasteTheObjectController>(() =>
        _i130.CopyAndPasteTheObjectController(
            objectAbst: gh<_i820.ObjectAbst>()));
    gh.factory<_i531.UpdateBlockListController>(() =>
        _i531.UpdateBlockListController(hosterAbst: gh<_i575.HosterAbst>()));
    gh.factory<_i546.GetAllowListController>(
        () => _i546.GetAllowListController(hosterAbst: gh<_i575.HosterAbst>()));
    gh.factory<_i325.GetHostsController>(
        () => _i325.GetHostsController(hosterAbst: gh<_i575.HosterAbst>()));
    gh.factory<_i842.UpdateAllowListController>(() =>
        _i842.UpdateAllowListController(hosterAbst: gh<_i575.HosterAbst>()));
    gh.factory<_i914.FetchSomeHostController>(() =>
        _i914.FetchSomeHostController(hosterAbst: gh<_i575.HosterAbst>()));
    gh.factory<_i287.RemoveHostsController>(
        () => _i287.RemoveHostsController(hosterAbst: gh<_i575.HosterAbst>()));
    gh.factory<_i523.GetHostScannigController>(() =>
        _i523.GetHostScannigController(hosterAbst: gh<_i575.HosterAbst>()));
    gh.factory<_i1067.PostInteractionController>(() =>
        _i1067.PostInteractionController(hosterAbst: gh<_i575.HosterAbst>()));
    gh.factory<_i293.GetHostInfoByPublicKeyController>(() =>
        _i293.GetHostInfoByPublicKeyController(
            hosterAbst: gh<_i575.HosterAbst>()));
    gh.factory<_i612.GetBlockListController>(
        () => _i612.GetBlockListController(hosterAbst: gh<_i575.HosterAbst>()));
    gh.factory<_i263.UpdateSomeHostController>(() =>
        _i263.UpdateSomeHostController(hosterAbst: gh<_i575.HosterAbst>()));
    gh.factory<_i635.AddContractController>(() =>
        _i635.AddContractController(contractAbst: gh<_i642.ContractAbst>()));
    gh.factory<_i259.ReleasePreviousContractController>(() =>
        _i259.ReleasePreviousContractController(
            contractAbst: gh<_i642.ContractAbst>()));
    gh.factory<_i329.DeleteContractByIdController>(() =>
        _i329.DeleteContractByIdController(
            contractAbst: gh<_i642.ContractAbst>()));
    gh.factory<_i443.GetContractsController>(() =>
        _i443.GetContractsController(contractAbst: gh<_i642.ContractAbst>()));
    gh.factory<_i895.GetContractByIdController>(() =>
        _i895.GetContractByIdController(
            contractAbst: gh<_i642.ContractAbst>()));
    gh.factory<_i728.AcquireAContractController>(() =>
        _i728.AcquireAContractController(
            contractAbst: gh<_i642.ContractAbst>()));
    return this;
  }
}
