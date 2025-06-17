import 'package:injectable/injectable.dart';

import '../../../../../../shared/services/cryptography/requests/generator_request.dart';
import '../abst/generate_the_key_abst.dart';

/// Project : [Renterd's Package]
/// Description : This file contains these Functionnalities [getAllAccounts, addDeposit, getAnAccountById, lockAnAccount, resetDrift, syncBalance, unLockAnAccount, updateBalance]
/// Author : [CotradeChain]
/// onCreated : 25/05/2023
/// onUpadted : #
/// AuthorCode : James Brel

@LazySingleton(as: GenerateTheKeyAbst)
class GenerateTheKeyImpl implements GenerateTheKeyAbst {
  /// Note : this function help you to generate the key

  @override
  Map<String, dynamic> generateKey({
    required String mailAndPassword,
  }) {
    return GeneratorRequest.generateKeyAndIv(mailAndPassword);
  }
}
