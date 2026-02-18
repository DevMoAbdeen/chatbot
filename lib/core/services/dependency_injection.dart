import "package:dio/dio.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "../../features/chat/data/repositories/chat_repository_impl.dart";
import "../../features/chat/data/services/chat_service.dart";
import "../../features/chat/data/services/gemini_chat_service.dart";
import "../../features/chat/domain/repositories/chat_repository.dart";
import "../../features/chat/presentation/controller/cubits/chat_cubit.dart";
import "../../features/onboarding/presentation/controller/cubits/onboarding_cubit.dart";
import "../../features/splash/presentation/controller/cubits/splash_cubit.dart";
import "../../infrastructure/local_storage_controller.dart";
import "../../infrastructure/shared_preferences.dart";
import "../networking/api/api_controller.dart";
import "../networking/api/dio_controller.dart";
import "../networking/internet/internet_connection_checker.dart";
import "../networking/internet/internet_controller.dart";
import "../observer/bloc_observer.dart";
import "environment_controller.dart";

GetIt getIt = GetIt.instance;

// registerSingleton => create object when open app
// registerLazySingleton => create object when need it

Future<void> setupServiceLocator() async {

  /// External ///
  getIt.registerLazySingleton<EnvironmentController>(() => EnvironmentController());
  getIt.registerLazySingleton<LocalStorageController>(() => SharedPrefController());
  getIt.registerLazySingleton<InternetController>(() => InternetConnectionCheckerController());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiController>(() => DioController(dio: getIt(), environment: getIt()));

  /// /////////////////////////////////////////////////////////////////// ///

  /// Core ///
  await getIt<EnvironmentController>().loadEnvFile();
  await getIt<LocalStorageController>().init();

  // Observers
  Bloc.observer = MyBlocObserver();


  /// /////////////////////////////////////////////////////////////////// ///

  /// Features (Splash)
  // Cubits //
  getIt.registerFactory(() => SplashCubit(localStorage: getIt())..start());

  /// Features (Onboarding)
  // Cubits //
  getIt.registerFactory(() => OnboardingCubit(localStorage: getIt()));

  /// Features (Chat)
  // Cubits //
  getIt.registerLazySingleton(() => ChatCubit(chatRepository: getIt()));

  // Repository //
  getIt.registerLazySingleton<ChatRepository>(() =>
      ChatRepositoryImpl(chatService: getIt(), internetController: getIt()));

  // Services //
  getIt.registerLazySingleton<ChatService>(() => GeminiChatService(apiController: getIt()));


}
