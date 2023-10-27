import 'package:flutter/material.dart';
import 'package:langurburja/src/core/assets/assets.gen.dart';
import 'package:langurburja/src/core/extensions/extensions.dart';
import 'package:langurburja/src/core/routes/router.dart';
import 'package:langurburja/src/core/themes/app_styles.dart';
import 'package:langurburja/src/core/widgets/custom_button.dart';
import 'package:langurburja/src/core/widgets/scaffold_wrapper.dart';

import '../../../core/themes/app_colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: SizedBox(
        width: context.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text("Play Langur Bhurja", style: AppStyles.text24PxSemiBold),
          30.verticalSpace,
          CustomButton.text(
              label: "Normal Mode",
              labelStyle: AppStyles.text16PxSemiBold,
              isDisabled: false,
              textColor: AppColors.white,
              fullWidth: true,
              backgroundColor: AppColors.primary,
              onPressed: () => AllRoutes.normalGameRoute()),
          20.verticalSpace,
          CustomButton.text(
              label: "Win Mode",
              labelStyle: AppStyles.text16PxSemiBold,
              isDisabled: false,
              fullWidth: true,
              textColor: AppColors.white,
              backgroundColor: AppColors.primary,
              onPressed: () => AllRoutes.normalGameRoute()),
          30.verticalSpace,
          ShowingDice(),
          (context.height / 6).verticalSpace,
        ]),
      ).px(20),
    );
  }
}

class ShowingDice extends StatelessWidget {
  ShowingDice({
    super.key,
  });
  final List<String> dice = [
    Assets.images.bhurja.path,
    Assets.images.langur.path,
    Assets.images.heart.path,
    Assets.images.ita.path,
    Assets.images.surat.path,
    Assets.images.chiri.path
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];

    for (int i = 0; i < dice.length; i += 3) {
      List<Widget> rowChildren = [];

      for (int j = i; j < i + 3 && j < dice.length; j++) {
        rowChildren.add(
          Column(
            children: [
              Image.asset(dice[j], height: 50),
              15.verticalSpace,
            ],
          ),
        );
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: rowChildren,
      ));
    }

    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rows,
      ),
    ).px(15);
  }
}
