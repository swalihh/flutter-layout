import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/interceptor/app_dio.dart';
import 'core/services/cache_services.dart';


final locator = GetIt.instance;

void setupLocator() {
  // Blocs

  // Remote Sources
  
  // Core Services
  locator.registerLazySingleton<CacheService>(() => CacheService());
  locator.registerLazySingleton<Dio>(() => Api().dio);
}
