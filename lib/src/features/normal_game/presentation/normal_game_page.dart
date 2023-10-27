import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:langurburja/src/core/extensions/extensions.dart';
import 'package:langurburja/src/core/routes/router.dart';
import 'package:langurburja/src/core/widgets/custom_button.dart';
import 'package:langurburja/src/core/widgets/scaffold_wrapper.dart';
import 'package:langurburja/src/features/normal_game/bloc/cubit/normal_game_cubit.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/themes/theme.dart';

class NormalGamePage extends StatelessWidget {
  NormalGamePage({super.key});
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
    return ScaffoldWrapper(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: context.width,
          child: Row(
            children: [
              BlocBuilder<NormalGameCubit, NormalGameState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () => Expanded(
                      child: Image.asset(
                        Assets.images.langur.path,
                      ),
                    ),
                    orElse: () => Container(),
                    loading: () => Expanded(
                      child: Image.asset(
                        Assets.images.video.path,
                      ),
                    ),
                    success: (pathIndex) => Expanded(
                      child: Image.asset(
                        dice[pathIndex[0]],
                      ),
                    ),
                  );
                },
              ),
              12.horizontalSpace,
              BlocBuilder<NormalGameCubit, NormalGameState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () => Expanded(
                      child: Image.asset(
                        Assets.images.langur.path,
                      ),
                    ),
                    orElse: () => Container(),
                    loading: () => Expanded(
                      child: Image.asset(
                        Assets.images.video.path,
                      ),
                    ),
                    success: (pathIndex) => Expanded(
                      child: Image.asset(
                        dice[pathIndex[1]],
                      ),
                    ),
                  );
                },
              ),
              12.horizontalSpace,
              BlocBuilder<NormalGameCubit, NormalGameState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () => Expanded(
                      child: Image.asset(
                        Assets.images.langur.path,
                      ),
                    ),
                    orElse: () => Container(),
                    loading: () => Expanded(
                      child: Image.asset(
                        Assets.images.video.path,
                      ),
                    ),
                    success: (pathIndex) => Expanded(
                      child: Image.asset(
                        dice[pathIndex[2]],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: context.width,
          child: Row(
            children: [
              BlocBuilder<NormalGameCubit, NormalGameState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () => Expanded(
                      child: Image.asset(
                        Assets.images.langur.path,
                      ),
                    ),
                    orElse: () => Container(),
                    loading: () => Expanded(
                      child: Image.asset(
                        Assets.images.video.path,
                      ),
                    ),
                    success: (pathIndex) => Expanded(
                      child: Image.asset(
                        dice[pathIndex[3]],
                      ),
                    ),
                  );
                },
              ),
              12.horizontalSpace,
              BlocBuilder<NormalGameCubit, NormalGameState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () => Expanded(
                      child: Image.asset(
                        Assets.images.langur.path,
                      ),
                    ),
                    orElse: () => Container(),
                    loading: () => Expanded(
                      child: Image.asset(
                        Assets.images.video.path,
                      ),
                    ),
                    success: (pathIndex) => Expanded(
                      child: Image.asset(
                        dice[pathIndex[4]],
                      ),
                    ),
                  );
                },
              ),
              12.horizontalSpace,
              BlocBuilder<NormalGameCubit, NormalGameState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () => Expanded(
                      child: Image.asset(
                        Assets.images.langur.path,
                      ),
                    ),
                    orElse: () => Container(),
                    loading: () => Expanded(
                      child: Image.asset(
                        Assets.images.video.path,
                      ),
                    ),
                    success: (pathIndex) => Expanded(
                      child: Image.asset(
                        dice[pathIndex[5]],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        30.verticalSpace,
        CustomButton.text(
          label: "Roll",
          labelStyle: AppStyles.text16PxBold,
          isDisabled: false,
          fullWidth: true,
          textColor: AppColors.white,
          backgroundColor: AppColors.primary,
          onPressed: () => context.read<NormalGameCubit>().startRolling(),
        ),
        10.verticalSpace,
        CustomButton.text(
            label: "Reset",
            labelStyle: AppStyles.text16PxBold,
            isDisabled: false,
            fullWidth: true,
            textColor: AppColors.white,
            backgroundColor: AppColors.primary,
            onPressed: () => AllRoutes.normalGameRoute()),
      ]).px(20),
    );
  }
}
