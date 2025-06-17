import 'package:injectable/injectable.dart';

import '../../data/abst/generate_the_key_abst.dart';

@Injectable()
class GenerateKeyController {
  final GenerateTheKeyAbst generateTheKeyAbst;

  GenerateKeyController({
    required this.generateTheKeyAbst,
  });

  Map<String, dynamic> call({
    required String mailAndPassword,
  }) {
    return generateTheKeyAbst.generateKey(
      mailAndPassword: mailAndPassword,
    );
  }
}
