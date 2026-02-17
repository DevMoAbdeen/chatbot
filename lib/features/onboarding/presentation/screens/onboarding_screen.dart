import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../core/extensions/navigation_extension.dart";
import "../../../../core/extensions/screen_size_extension.dart";
import "../../../../core/extensions/sized_box_extension.dart";
import "../../../../core/routing/router_list.dart";
import "../../../../core/services/dependency_injection.dart";
import "../controller/cubits/onboarding_cubit.dart";
import "../controller/states/onboarding_state.dart";
import "../widgets/continue_button.dart";
import "../widgets/onboarding_image.dart";
import "../widgets/onboarding_wide_panel.dart";
import "../widgets/onboarding_texts_column.dart";

// This widget is only responsible for creating and providing Cubit
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>(
      create: (context) => getIt<OnboardingCubit>(),
      child: const OnboardingView(),
    );
  }
}

// This widget is responsible for the UI and listening to Cubit state changes
class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isWideLayout = context.isLandscape || context.isLargeScreen;

    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingCompleted) {
          context.pushNamedAndRemoveUntil(RouterList.chatScreen);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (isWideLayout) {
                return Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: OnboardingImage(isLargeScreen: true),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: colorScheme.outlineVariant.withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                        child: OnboardingWidePanel(
                          onPressed: () => context.read<OnboardingCubit>().completeOnboarding(),
                        ),
                      ),
                    ),
                  ],
                );
              }

              // Portrait / Small Screen Layout
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          70.heightSpace(),
                          const OnboardingTextsColumn(),
                          70.heightSpace(),
                          const OnboardingImage(),
                          const Spacer(),
                          ContinueButton(
                            onPressed: () => context.read<OnboardingCubit>().completeOnboarding(),
                          ),
                          16.heightSpace(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}