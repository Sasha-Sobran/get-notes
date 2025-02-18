import 'package:frontendik/router/router.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
}
