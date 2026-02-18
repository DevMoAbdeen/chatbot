import "package:chatbot/infrastructure/local_storage_controller.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../states/onboarding_state.dart";

class OnboardingCubit extends Cubit<OnboardingState> {
  final LocalStorageController localStorage;

  OnboardingCubit({required this.localStorage}) : super(OnboardingInitial());

  Future<void> completeOnboarding() async {
    await localStorage.setData(key: Keys.onboardingCompleted, value: true);
    emit(OnboardingCompleted());
  }
}
