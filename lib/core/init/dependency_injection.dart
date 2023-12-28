import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/feature/root/_root_exports.dart';

final dependencyInjector = GetIt.instance;

Future<void> init() async {
  //! Core
  //? Packages
  dependencyInjector.registerLazySingleton<FlutterSecureStorage>(FlutterSecureStorage.new);

  dependencyInjector.registerFactory<Dio>(() => Dio());

  //! Core
  //? Utils
  dependencyInjector.registerLazySingleton<LocalStorageRepository>(
    () => SecureStorageRepositoryImpl(
      dependencyInjector<FlutterSecureStorage>(),
    ),
  );

  dependencyInjector.registerFactory<BaseRequestRepository>(
    () => MainRequestImpl(
      dependencyInjector<Dio>(),
    ),
  );

  dependencyInjector.registerLazySingleton<GetRequest>(
    () => GetRequest(
      dependencyInjector<BaseRequestRepository>(),
    ),
  );

  dependencyInjector.registerLazySingleton<PostRequest>(
    () => PostRequest(
      dependencyInjector<BaseRequestRepository>(),
    ),
  );

  //! Features
  //? Root
  //* Controller
  dependencyInjector.registerFactory<RootController>(
    () => RootController(
      dependencyInjector<LocalStorageRepository>(),
      dependencyInjector<PostRequest>(),
    ),
  );

  //? Credential
  //* Repo
  dependencyInjector.registerLazySingleton<LoginRepository>(
    () => LoginRepoImpl(
      dependencyInjector<LocalStorageRepository>(),
    ),
  );

  dependencyInjector.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(
      loginRepository: dependencyInjector<LoginRepository>(),
    ),
  );

  //? Credential
  //* Controller
  dependencyInjector.registerFactory<LoginController>(
    () => LoginController(
      dependencyInjector<LoginUsecase>(),
    ),
  );
}
