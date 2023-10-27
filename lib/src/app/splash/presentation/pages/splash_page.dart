import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:langurburja/src/core/assets/assets.gen.dart';
import 'package:langurburja/src/core/themes/theme.dart';
import 'package:langurburja/src/core/widgets/scaffold_wrapper.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: Assets.images.bhurja.provider(),
              fit: BoxFit.cover,
            ),
          ),
        ).animate().fade(duration: 500.ms),
      ),
    );
  }
}
