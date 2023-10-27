import 'package:flutter/material.dart';
import 'package:langurburja/src/core/themes/app_styles.dart';
import 'package:langurburja/src/core/widgets/custom_button.dart';
import 'package:langurburja/src/core/widgets/scaffold_wrapper.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: Column(children: [
        Text("Play", style: AppStyles.text14PxMedium),
        CustomButton.text(label: "Normal Mode", onPressed: () {}),
      ]),
    );
  }
}
