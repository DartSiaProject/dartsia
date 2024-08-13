// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/add_deposit_controller.dart'
    as _i20;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/get_all_accounts_controller.dart'
    as _i21;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/get_an_account_by_id_controller.dart'
    as _i22;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/lock_an_account_controller.dart'
    as _i23;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/reset_drift_controller.dart'
    as _i24;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/sync_balance_controller.dart'
    as _i25;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/un_lock_an_account_controller.dart'
    as _i26;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/update_balance_controller.dart'
    as _i27;
import '../../../modules/renterd_mod/features/bus/controllers/consensus_controllers/accept_block_controller.dart'
    as _i13;
import '../../../modules/renterd_mod/features/bus/controllers/consensus_controllers/get_sia_fund_fee_controller.dart'
    as _i14;
import '../../../modules/renterd_mod/features/bus/controllers/consensus_controllers/get_state_controller.dart'
    as _i15;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/acquire_a_contract_controller.dart'
    as _i45;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/add_contract_controller.dart'
    as _i46;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/delete_contract_by_id_controller.dart'
    as _i47;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/get_contract_by_id_controller.dart'
    as _i49;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/get_contracts_controller.dart'
    as _i48;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/release_presious_contract_controller.dart'
    as _i50;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/fetch_some_host_controller.dart'
    as _i34;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_allow_list_controller.dart'
    as _i35;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_block_list_controller.dart'
    as _i36;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_host_info_by_public_key_controller.dart'
    as _i38;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_host_scanning_controller.dart'
    as _i39;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_hosts_controller.dart'
    as _i37;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/post_interaction_controller.dart'
    as _i40;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/remove_hosts_controller.dart'
    as _i41;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/update_allow_list_controller.dart'
    as _i42;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/update_block_list_controller.dart'
    as _i43;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/update_some_host_controller.dart'
    as _i44;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/copy_and_paste_the_object_controller.dart'
    as _i28;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/delete_the_object_controller.dart'
    as _i29;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/get_details_of_object_controller.dart'
    as _i33;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/get_the_list_of_bucket_controller.dart'
    as _i32;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/get_the_list_of_object_controller.dart'
    as _i30;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/rename_an_object_controller.dart'
    as _i31;
import '../../../modules/renterd_mod/features/bus/data/abstract/accounts_abst.dart'
    as _i7;
import '../../../modules/renterd_mod/features/bus/data/abstract/consensus_abst.dart'
    as _i3;
import '../../../modules/renterd_mod/features/bus/data/abstract/contract_abst.dart'
    as _i18;
import '../../../modules/renterd_mod/features/bus/data/abstract/hoster_abst.dart'
    as _i16;
import '../../../modules/renterd_mod/features/bus/data/abstract/object_abst.dart'
    as _i9;
import '../../../modules/renterd_mod/features/bus/data/impls/accounts_impl.dart'
    as _i8;
import '../../../modules/renterd_mod/features/bus/data/impls/consensus_impl.dart'
    as _i4;
import '../../../modules/renterd_mod/features/bus/data/impls/contract_impl.dart'
    as _i19;
import '../../../modules/renterd_mod/features/bus/data/impls/hoster_impl.dart'
    as _i17;
import '../../../modules/renterd_mod/features/bus/data/impls/object_impl.dart'
    as _i10;
import '../../../modules/renterd_mod/features/worker/controllers/object_controllers/download_the_object_controller.dart'
    as _i12;
import '../../../modules/renterd_mod/features/worker/controllers/object_controllers/upload_the_object_controller.dart'
    as _i11;
import '../../../modules/renterd_mod/features/worker/data/abstract/worker_object_abst.dart'
    as _i5;
import '../../../modules/renterd_mod/features/worker/data/impls/worker_object_impl.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ConsensusAbst>(() => _i4.ConsensusImpl());
    gh.lazySingleton<_i5.WorkerObjectAbst>(() => _i6.WorkerObjectImpl());
    gh.lazySingleton<_i7.AccountsAbst>(() => _i8.AccountsImpl());
    gh.lazySingleton<_i9.ObjectAbst>(() => _i10.ObjectImpl());
    gh.factory<_i11.UploadTheObjectController>(() =>
        _i11.UploadTheObjectController(
            workerObjectAbst: gh<_i5.WorkerObjectAbst>()));
    gh.factory<_i12.DownloadTheObjectController>(() =>
        _i12.DownloadTheObjectController(
            workerObjectAbst: gh<_i5.WorkerObjectAbst>()));
    gh.factory<_i13.AcceptBlockController>(() =>
        _i13.AcceptBlockController(consensusAbst: gh<_i3.ConsensusAbst>()));
    gh.factory<_i14.GetSiaFundFeeController>(() =>
        _i14.GetSiaFundFeeController(consensusAbst: gh<_i3.ConsensusAbst>()));
    gh.factory<_i15.GetStateController>(
        () => _i15.GetStateController(consensusAbst: gh<_i3.ConsensusAbst>()));
    gh.lazySingleton<_i16.HosterAbst>(() => _i17.HosterImpl());
    gh.lazySingleton<_i18.ContractAbst>(() => _i19.ContractImpl());
    gh.factory<_i20.AddDepositController>(
        () => _i20.AddDepositController(accountsAbst: gh<_i7.AccountsAbst>()));
    gh.factory<_i21.GetAllAccountsController>(() =>
        _i21.GetAllAccountsController(accountsAbst: gh<_i7.AccountsAbst>()));
    gh.factory<_i22.GetAnAccountByIdController>(() =>
        _i22.GetAnAccountByIdController(accountsAbst: gh<_i7.AccountsAbst>()));
    gh.factory<_i23.LockAnAccountController>(() =>
        _i23.LockAnAccountController(accountsAbst: gh<_i7.AccountsAbst>()));
    gh.factory<_i24.ResetDriftController>(
        () => _i24.ResetDriftController(accountsAbst: gh<_i7.AccountsAbst>()));
    gh.factory<_i25.SyncBalanceController>(
        () => _i25.SyncBalanceController(accountsAbst: gh<_i7.AccountsAbst>()));
    gh.factory<_i26.UnLockAnAccountController>(() =>
        _i26.UnLockAnAccountController(accountsAbst: gh<_i7.AccountsAbst>()));
    gh.factory<_i27.UpdateBalanceController>(() =>
        _i27.UpdateBalanceController(accountsAbst: gh<_i7.AccountsAbst>()));
    gh.factory<_i28.CopyAndPasteTheObjectController>(() =>
        _i28.CopyAndPasteTheObjectController(objectAbst: gh<_i9.ObjectAbst>()));
    gh.factory<_i29.DeleteTheObjectController>(
        () => _i29.DeleteTheObjectController(objectAbst: gh<_i9.ObjectAbst>()));
    gh.factory<_i30.GetTheListOfObjectController>(() =>
        _i30.GetTheListOfObjectController(objectAbst: gh<_i9.ObjectAbst>()));
    gh.factory<_i31.RenameAnObjectController>(
        () => _i31.RenameAnObjectController(objectAbst: gh<_i9.ObjectAbst>()));
    gh.factory<_i32.GetTheListOfBucketController>(() =>
        _i32.GetTheListOfBucketController(objectAbst: gh<_i9.ObjectAbst>()));
    gh.factory<_i33.GetTheDetailsOfObjectController>(() =>
        _i33.GetTheDetailsOfObjectController(objectAbst: gh<_i9.ObjectAbst>()));
    gh.factory<_i34.FetchSomeHostController>(
        () => _i34.FetchSomeHostController(hosterAbst: gh<_i16.HosterAbst>()));
    gh.factory<_i35.GetAllowListController>(
        () => _i35.GetAllowListController(hosterAbst: gh<_i16.HosterAbst>()));
    gh.factory<_i36.GetBlockListController>(
        () => _i36.GetBlockListController(hosterAbst: gh<_i16.HosterAbst>()));
    gh.factory<_i37.GetHostsController>(
        () => _i37.GetHostsController(hosterAbst: gh<_i16.HosterAbst>()));
    gh.factory<_i38.GetHostInfoByPublicKeyController>(() =>
        _i38.GetHostInfoByPublicKeyController(
            hosterAbst: gh<_i16.HosterAbst>()));
    gh.factory<_i39.GetHostScannigController>(
        () => _i39.GetHostScannigController(hosterAbst: gh<_i16.HosterAbst>()));
    gh.factory<_i40.PostInteractionController>(() =>
        _i40.PostInteractionController(hosterAbst: gh<_i16.HosterAbst>()));
    gh.factory<_i41.RemoveHostsController>(
        () => _i41.RemoveHostsController(hosterAbst: gh<_i16.HosterAbst>()));
    gh.factory<_i42.UpdateAllowListController>(() =>
        _i42.UpdateAllowListController(hosterAbst: gh<_i16.HosterAbst>()));
    gh.factory<_i43.UpdateBlockListController>(() =>
        _i43.UpdateBlockListController(hosterAbst: gh<_i16.HosterAbst>()));
    gh.factory<_i44.UpdateSomeHostController>(
        () => _i44.UpdateSomeHostController(hosterAbst: gh<_i16.HosterAbst>()));
    gh.factory<_i45.AcquireAContractController>(() =>
        _i45.AcquireAContractController(contractAbst: gh<_i18.ContractAbst>()));
    gh.factory<_i46.AddContractController>(() =>
        _i46.AddContractController(contractAbst: gh<_i18.ContractAbst>()));
    gh.factory<_i47.DeleteContractByIdController>(() =>
        _i47.DeleteContractByIdController(
            contractAbst: gh<_i18.ContractAbst>()));
    gh.factory<_i48.GetContractsController>(() =>
        _i48.GetContractsController(contractAbst: gh<_i18.ContractAbst>()));
    gh.factory<_i49.GetContractByIdController>(() =>
        _i49.GetContractByIdController(contractAbst: gh<_i18.ContractAbst>()));
    gh.factory<_i50.ReleasePreviousContractController>(() =>
        _i50.ReleasePreviousContractController(
            contractAbst: gh<_i18.ContractAbst>()));
    return this;
  }
}
