import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:langurburja/src/features/landing_page/presentation/landing_page.dart';

class AllRoutes {
  AllRoutes._();

  static void homeRoutes() {
    Get.off(() => const LandingPage(), transition: Transition.fadeIn, duration: 500.ms, curve: Curves.easeIn);
  }
}
