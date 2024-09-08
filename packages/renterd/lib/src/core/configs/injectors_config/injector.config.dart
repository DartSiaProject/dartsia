// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../modules/crypto_mod/features/generate_key/controllers/crypto_controllers/generate_key_controller.dart'
    as _i20;
import '../../../modules/crypto_mod/features/generate_key/data/abst/generate_the_key_abst.dart'
    as _i5;
import '../../../modules/crypto_mod/features/generate_key/data/impls/generate_the_key_impl.dart'
    as _i6;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/add_deposit_controller.dart'
    as _i23;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/get_all_accounts_controller.dart'
    as _i24;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/get_an_account_by_id_controller.dart'
    as _i25;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/lock_an_account_controller.dart'
    as _i26;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/reset_drift_controller.dart'
    as _i27;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/sync_balance_controller.dart'
    as _i28;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/un_lock_an_account_controller.dart'
    as _i29;
import '../../../modules/renterd_mod/features/bus/controllers/accounts_controllers/update_balance_controller.dart'
    as _i30;
import '../../../modules/renterd_mod/features/bus/controllers/consensus_controllers/accept_block_controller.dart'
    as _i15;
import '../../../modules/renterd_mod/features/bus/controllers/consensus_controllers/get_sia_fund_fee_controller.dart'
    as _i16;
import '../../../modules/renterd_mod/features/bus/controllers/consensus_controllers/get_state_controller.dart'
    as _i17;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/acquire_a_contract_controller.dart'
    as _i48;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/add_contract_controller.dart'
    as _i49;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/delete_contract_by_id_controller.dart'
    as _i50;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/get_contract_by_id_controller.dart'
    as _i52;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/get_contracts_controller.dart'
    as _i51;
import '../../../modules/renterd_mod/features/bus/controllers/contract_controllers/release_presious_contract_controller.dart'
    as _i53;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/fetch_some_host_controller.dart'
    as _i37;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_allow_list_controller.dart'
    as _i38;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_block_list_controller.dart'
    as _i39;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_host_info_by_public_key_controller.dart'
    as _i41;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_host_scanning_controller.dart'
    as _i42;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/get_hosts_controller.dart'
    as _i40;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/post_interaction_controller.dart'
    as _i43;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/remove_hosts_controller.dart'
    as _i44;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/update_allow_list_controller.dart'
    as _i45;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/update_block_list_controller.dart'
    as _i46;
import '../../../modules/renterd_mod/features/bus/controllers/hoster_controllers/update_some_host_controller.dart'
    as _i47;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/copy_and_paste_the_object_controller.dart'
    as _i31;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/delete_the_object_controller.dart'
    as _i32;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/get_details_of_object_controller.dart'
    as _i33;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/get_the_list_of_bucket_controller.dart'
    as _i34;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/get_the_list_of_object_controller.dart'
    as _i35;
import '../../../modules/renterd_mod/features/bus/controllers/object_controllers/rename_an_object_controller.dart'
    as _i36;
import '../../../modules/renterd_mod/features/bus/data/abstract/accounts_abst.dart'
    as _i9;
import '../../../modules/renterd_mod/features/bus/data/abstract/consensus_abst.dart'
    as _i3;
import '../../../modules/renterd_mod/features/bus/data/abstract/contract_abst.dart'
    as _i21;
import '../../../modules/renterd_mod/features/bus/data/abstract/hoster_abst.dart'
    as _i18;
import '../../../modules/renterd_mod/features/bus/data/abstract/object_abst.dart'
    as _i11;
import '../../../modules/renterd_mod/features/bus/data/impls/accounts_impl.dart'
    as _i10;
import '../../../modules/renterd_mod/features/bus/data/impls/consensus_impl.dart'
    as _i4;
import '../../../modules/renterd_mod/features/bus/data/impls/contract_impl.dart'
    as _i22;
import '../../../modules/renterd_mod/features/bus/data/impls/hoster_impl.dart'
    as _i19;
import '../../../modules/renterd_mod/features/bus/data/impls/object_impl.dart'
    as _i12;
import '../../../modules/renterd_mod/features/worker/controllers/object_controllers/download_the_object_controller.dart'
    as _i13;
import '../../../modules/renterd_mod/features/worker/controllers/object_controllers/upload_the_object_controller.dart'
    as _i14;
import '../../../modules/renterd_mod/features/worker/data/abstract/worker_object_abst.dart'
    as _i7;
import '../../../modules/renterd_mod/features/worker/data/impls/worker_object_impl.dart'
    as _i8;

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
    gh.lazySingleton<_i5.GenerateTheKeyAbst>(() => _i6.GenerateTheKeyImpl());
    gh.lazySingleton<_i7.WorkerObjectAbst>(() => _i8.WorkerObjectImpl());
    gh.lazySingleton<_i9.AccountsAbst>(() => _i10.AccountsImpl());
    gh.lazySingleton<_i11.ObjectAbst>(() => _i12.ObjectImpl());
    gh.factory<_i13.DownloadTheObjectController>(() =>
        _i13.DownloadTheObjectController(
            workerObjectAbst: gh<_i7.WorkerObjectAbst>()));
    gh.factory<_i14.UploadTheObjectController>(() =>
        _i14.UploadTheObjectController(
            workerObjectAbst: gh<_i7.WorkerObjectAbst>()));
    gh.factory<_i15.AcceptBlockController>(() =>
        _i15.AcceptBlockController(consensusAbst: gh<_i3.ConsensusAbst>()));
    gh.factory<_i16.GetSiaFundFeeController>(() =>
        _i16.GetSiaFundFeeController(consensusAbst: gh<_i3.ConsensusAbst>()));
    gh.factory<_i17.GetStateController>(
        () => _i17.GetStateController(consensusAbst: gh<_i3.ConsensusAbst>()));
    gh.lazySingleton<_i18.HosterAbst>(() => _i19.HosterImpl());
    gh.factory<_i20.GenerateKeyController>(() => _i20.GenerateKeyController(
        generateTheKeyAbst: gh<_i5.GenerateTheKeyAbst>()));
    gh.lazySingleton<_i21.ContractAbst>(() => _i22.ContractImpl());
    gh.factory<_i23.AddDepositController>(
        () => _i23.AddDepositController(accountsAbst: gh<_i9.AccountsAbst>()));
    gh.factory<_i24.GetAllAccountsController>(() =>
        _i24.GetAllAccountsController(accountsAbst: gh<_i9.AccountsAbst>()));
    gh.factory<_i25.GetAnAccountByIdController>(() =>
        _i25.GetAnAccountByIdController(accountsAbst: gh<_i9.AccountsAbst>()));
    gh.factory<_i26.LockAnAccountController>(() =>
        _i26.LockAnAccountController(accountsAbst: gh<_i9.AccountsAbst>()));
    gh.factory<_i27.ResetDriftController>(
        () => _i27.ResetDriftController(accountsAbst: gh<_i9.AccountsAbst>()));
    gh.factory<_i28.SyncBalanceController>(
        () => _i28.SyncBalanceController(accountsAbst: gh<_i9.AccountsAbst>()));
    gh.factory<_i29.UnLockAnAccountController>(() =>
        _i29.UnLockAnAccountController(accountsAbst: gh<_i9.AccountsAbst>()));
    gh.factory<_i30.UpdateBalanceController>(() =>
        _i30.UpdateBalanceController(accountsAbst: gh<_i9.AccountsAbst>()));
    gh.factory<_i31.CopyAndPasteTheObjectController>(() =>
        _i31.CopyAndPasteTheObjectController(
            objectAbst: gh<_i11.ObjectAbst>()));
    gh.factory<_i32.DeleteTheObjectController>(() =>
        _i32.DeleteTheObjectController(objectAbst: gh<_i11.ObjectAbst>()));
    gh.factory<_i33.GetTheDetailsOfObjectController>(() =>
        _i33.GetTheDetailsOfObjectController(
            objectAbst: gh<_i11.ObjectAbst>()));
    gh.factory<_i34.GetTheListOfBucketController>(() =>
        _i34.GetTheListOfBucketController(objectAbst: gh<_i11.ObjectAbst>()));
    gh.factory<_i35.GetTheListOfObjectController>(() =>
        _i35.GetTheListOfObjectController(objectAbst: gh<_i11.ObjectAbst>()));
    gh.factory<_i36.RenameAnObjectController>(
        () => _i36.RenameAnObjectController(objectAbst: gh<_i11.ObjectAbst>()));
    gh.factory<_i37.FetchSomeHostController>(
        () => _i37.FetchSomeHostController(hosterAbst: gh<_i18.HosterAbst>()));
    gh.factory<_i38.GetAllowListController>(
        () => _i38.GetAllowListController(hosterAbst: gh<_i18.HosterAbst>()));
    gh.factory<_i39.GetBlockListController>(
        () => _i39.GetBlockListController(hosterAbst: gh<_i18.HosterAbst>()));
    gh.factory<_i40.GetHostsController>(
        () => _i40.GetHostsController(hosterAbst: gh<_i18.HosterAbst>()));
    gh.factory<_i41.GetHostInfoByPublicKeyController>(() =>
        _i41.GetHostInfoByPublicKeyController(
            hosterAbst: gh<_i18.HosterAbst>()));
    gh.factory<_i42.GetHostScannigController>(
        () => _i42.GetHostScannigController(hosterAbst: gh<_i18.HosterAbst>()));
    gh.factory<_i43.PostInteractionController>(() =>
        _i43.PostInteractionController(hosterAbst: gh<_i18.HosterAbst>()));
    gh.factory<_i44.RemoveHostsController>(
        () => _i44.RemoveHostsController(hosterAbst: gh<_i18.HosterAbst>()));
    gh.factory<_i45.UpdateAllowListController>(() =>
        _i45.UpdateAllowListController(hosterAbst: gh<_i18.HosterAbst>()));
    gh.factory<_i46.UpdateBlockListController>(() =>
        _i46.UpdateBlockListController(hosterAbst: gh<_i18.HosterAbst>()));
    gh.factory<_i47.UpdateSomeHostController>(
        () => _i47.UpdateSomeHostController(hosterAbst: gh<_i18.HosterAbst>()));
    gh.factory<_i48.AcquireAContractController>(() =>
        _i48.AcquireAContractController(contractAbst: gh<_i21.ContractAbst>()));
    gh.factory<_i49.AddContractController>(() =>
        _i49.AddContractController(contractAbst: gh<_i21.ContractAbst>()));
    gh.factory<_i50.DeleteContractByIdController>(() =>
        _i50.DeleteContractByIdController(
            contractAbst: gh<_i21.ContractAbst>()));
    gh.factory<_i51.GetContractsController>(() =>
        _i51.GetContractsController(contractAbst: gh<_i21.ContractAbst>()));
    gh.factory<_i52.GetContractByIdController>(() =>
        _i52.GetContractByIdController(contractAbst: gh<_i21.ContractAbst>()));
    gh.factory<_i53.ReleasePreviousContractController>(() =>
        _i53.ReleasePreviousContractController(
            contractAbst: gh<_i21.ContractAbst>()));
    return this;
  }
}
