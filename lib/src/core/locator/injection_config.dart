import 'package:get_it/get_it.dart';

import 'injection_container.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  initGetItGetx();
}
