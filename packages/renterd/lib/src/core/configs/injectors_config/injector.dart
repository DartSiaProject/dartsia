import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

var sl = GetIt.instance;
@InjectableInit(
  generateForDir: ["lib", "test"],
  preferRelativeImports: true,
)
Future<void> renterdInit() async => sl.init();
