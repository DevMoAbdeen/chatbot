import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../../core/services/onboarding_local_storage.dart";
import "../states/splash_state.dart";

class SplashCubit extends Cubit<SplashState> {
  final OnboardingLocalStorage onboardingStorage;

  SplashCubit({required this.onboardingStorage}) : super(SplashInitial());

  Future<void> start() async {
    await Future.delayed(const Duration(seconds: 2));

    final completed = onboardingStorage.isCompleted();

    if (completed) {
      emit(SplashGoToChat());
    } else {
      emit(SplashGoToOnboarding());
    }
  }
}
