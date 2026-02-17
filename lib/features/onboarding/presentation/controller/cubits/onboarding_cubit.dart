import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../../core/services/onboarding_local_storage.dart";
import "../states/onboarding_state.dart";

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingLocalStorage onboardingStorage;

  OnboardingCubit({required this.onboardingStorage}) : super(OnboardingInitial());

  Future<void> completeOnboarding() async {
    await onboardingStorage.setCompleted();
    emit(OnboardingCompleted());
  }
}
