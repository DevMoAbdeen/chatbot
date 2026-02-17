import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../core/extensions/navigation_extension.dart";
import "../../../../core/routing/router_list.dart";
import "../../../../core/services/dependency_injection.dart";
import "../controller/cubits/splash_cubit.dart";
import "../controller/states/splash_state.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider<SplashCubit>(
      create: (_) => getIt<SplashCubit>(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashGoToChat) {
            context.pushNamedAndRemoveUntil(RouterList.chatScreen);
          }
          if (state is SplashGoToOnboarding) {
            context.pushNamedAndRemoveUntil(RouterList.onboardingScreen);
          }
        },
        child: Scaffold(
          backgroundColor: colorScheme.primary,
          body: Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                "assets/icons/logo.webp",
                width: 170,
                height: 170,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
