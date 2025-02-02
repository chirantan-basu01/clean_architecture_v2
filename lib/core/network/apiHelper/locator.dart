import 'package:educare_erp/core/network/apiClientRepository/api_client.dart';
import 'package:educare_erp/core/network/apiClientRepository/api_client_impl.dart';
import 'package:educare_erp/core/network/networkRepository/network_client.dart';
import 'package:educare_erp/core/network/networkRepository/network_client_impl.dart';
import 'package:educare_erp/core/services/localStorage/shared_pref.dart';
import 'package:educare_erp/core/services/localStorage/shared_pref_impl.dart';
import 'package:educare_erp/features/test/testRepository/test_usecase.dart';
import 'package:educare_erp/features/test/testRepository/test_usecase_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initializeDependency() {
  getIt.registerFactory<NetworkClient>(() => NetworkClientImpl());
  getIt.registerFactory<SharedPref>(() => SharedPrefImpl());
  getIt.registerFactory<ApiClient>(() => ApiClientImpl());
  getIt.registerFactory<TestUseCases>(() => TestUseCaseImplementation());
}
