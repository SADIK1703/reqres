import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:reqres/core/_core_exports.dart';

final dependencyInjector = GetIt.instance;

Future<void> init() async {
  //! Core
  //? Packages
  dependencyInjector.registerLazySingleton<FlutterSecureStorage>(FlutterSecureStorage.new);

  dependencyInjector.registerFactory<Dio>(() => Dio());

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

  //! Features
