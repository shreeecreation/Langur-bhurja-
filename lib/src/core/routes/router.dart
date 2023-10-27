import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:langurburja/src/features/landing_page/presentation/landing_page.dart';
import '../../features/normal_game/presentation/normal_game_page.dart';

class AllRoutes {
  AllRoutes._();

  static void homeRoute() {
    Get.off(() => const LandingPage(), transition: Transition.fadeIn, duration: 500.ms, curve: Curves.easeIn);
  }

  static void normalGameRoute() {
    Get.to(() => const NormalGamePage(), transition: Transition.fadeIn, duration: 500.ms, curve: Curves.easeIn);
  }
}
