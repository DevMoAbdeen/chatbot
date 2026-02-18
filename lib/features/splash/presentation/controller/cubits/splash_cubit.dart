import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../../infrastructure/local_storage_controller.dart";
import "../states/splash_state.dart";

class SplashCubit extends Cubit<SplashState> {
  final LocalStorageController localStorage;

  SplashCubit({required this.localStorage}) : super(SplashInitial());

  Future<void> start() async {
    await Future.delayed(const Duration(seconds: 2));

    final completed = localStorage.isKeyExist(key: Keys.onboardingCompleted) &&
        localStorage.getData(key: Keys.onboardingCompleted) == true;

    if (completed) {
      emit(SplashGoToChat());
    } else {
      emit(SplashGoToOnboarding());
    }
  }
}
