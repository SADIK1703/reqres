import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:reqres/core/_core_exports.dart';
import 'package:reqres/feature/credential/_login_exports.dart';
import 'package:reqres/feature/root/_root_exports.dart';
import 'package:reqres/feature/user_list/_user_list_exports.dart';

final dependencyInjector = GetIt.instance;

Future<void> init() async {
  //! Core
  //? Packages
  dependencyInjector.registerLazySingleton<FlutterSecureStorage>(
    FlutterSecureStorage.new,
  );

  dependencyInjector.registerFactory<Dio>(
    () => Dio(),
  );

  //! Core
  //? Utils
  dependencyInjector.registerLazySingleton<LocalStorageRepository>(
    () => SecureStorageRepositoryImpl(
      dependencyInjector<FlutterSecureStorage>(),
    ),
  );

  dependencyInjector.registerFactory<GetCachedDataUsecase>(
    () => GetCachedDataUsecase(
      dependencyInjector<LocalStorageRepository>(),
    ),
  );

  dependencyInjector.registerFactory<SaveDataCacheUsecase>(
    () => SaveDataCacheUsecase(
      dependencyInjector<LocalStorageRepository>(),
    ),
  );

  dependencyInjector.registerFactory<RemoveCachedDataUsecase>(
    () => RemoveCachedDataUsecase(
      dependencyInjector<LocalStorageRepository>(),
    ),
  );

  dependencyInjector.registerFactory<BaseRequestRepository>(
    () => MainRequestImpl(
      dependencyInjector<Dio>(),
    ),
  );

  dependencyInjector.registerLazySingleton<GetRequestUsecase>(
    () => GetRequestUsecase(
      dependencyInjector<BaseRequestRepository>(),
    ),
  );

  dependencyInjector.registerLazySingleton<PostRequestUsecase>(
    () => PostRequestUsecase(
      dependencyInjector<BaseRequestRepository>(),
    ),
  );

  //! Features
  //? Root
  //* Controller
  dependencyInjector.registerFactory<RootController>(
    () => RootController(
      dependencyInjector<PostRequestUsecase>(),
      dependencyInjector<GetCachedDataUsecase>(),
    ),
  );

  //? Credential
  //* Repo
  dependencyInjector.registerLazySingleton<LoginRepository>(
    () => LoginRepoImpl(
      dependencyInjector<PostRequestUsecase>(),
      dependencyInjector<SaveDataCacheUsecase>(),
      dependencyInjector<RemoveCachedDataUsecase>(),
    ),
  );

  dependencyInjector.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(
      loginRepository: dependencyInjector<LoginRepository>(),
    ),
  );

  dependencyInjector.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(
      loginRepository: dependencyInjector<LoginRepository>(),
    ),
  );

  //? Credential
  //* Controller
  dependencyInjector.registerLazySingleton<LoginController>(
    () => LoginController(
      dependencyInjector<RegisterUsecase>(),
    ),
  );

  //? User List
  //* Repo
  dependencyInjector.registerLazySingleton<UserListRepository>(
    () => UserListRepoImpl(
      dependencyInjector<GetRequestUsecase>(),
    ),
  );

  dependencyInjector.registerLazySingleton<FetchUserListUsecase>(
    () => FetchUserListUsecase(
      dependencyInjector<UserListRepository>(),
    ),
  );

  //? User List
  //* Controller
  dependencyInjector.registerFactory<ChangeNotifierProvider<UserListController>>(
    () => ChangeNotifierProvider(
      (ref) => UserListController(
        dependencyInjector<FetchUserListUsecase>(),
      ),
    ),
  );
}
