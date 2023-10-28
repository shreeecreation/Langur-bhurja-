import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:langurburja/src/core/assets/assets.gen.dart';
import 'package:langurburja/src/core/routes/router.dart';
import 'package:langurburja/src/core/themes/theme.dart';
import 'package:langurburja/src/core/widgets/scaffold_wrapper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      AllRoutes.homeRoute();
    });
  }

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
