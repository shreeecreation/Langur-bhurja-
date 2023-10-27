import 'package:get/get.dart';
import 'package:langurburja/src/features/landing_page/presentation/landing_page.dart';

class AllRoutes {
  AllRoutes._();

  static void homeRoutes() {
    Get.offAll(const LandingPage(), transition: Transition.fadeIn);
  }
}
