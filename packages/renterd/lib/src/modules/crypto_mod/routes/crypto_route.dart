import '../../../core/configs/injectors_config/injector.dart';
import '../features/generate_key/controllers/crypto_controllers/generate_key_controller.dart';

class Crypto {
  static Map<String, dynamic> generateTheKey({
    required String mailAndPassword,
  }) =>
      sl<GenerateKeyController>().call(
        mailAndPassword: mailAndPassword,
      );
}
