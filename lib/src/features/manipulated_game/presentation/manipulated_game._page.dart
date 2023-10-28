import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:langurburja/src/core/extensions/extensions.dart';
import 'package:langurburja/src/core/widgets/custom_button.dart';
import 'package:langurburja/src/core/widgets/scaffold_wrapper.dart';
import 'package:langurburja/src/features/normal_game/bloc/cubit/normal_game_cubit.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/themes/theme.dart';
import 'widgets/question_mark_dialog_box.dart';

class ManipulatedGamePage extends StatelessWidget {
  ManipulatedGamePage({super.key});
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
      appBar: AppBar(title: Text("Win Mode", style: AppStyles.text24Px), actions: [
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
          child: IconButton(
            icon: const Icon(Icons.question_mark, color: AppColors.white, size: 35),
            onPressed: () => QuestionMarkDialogBox.showDialogs(context),
          ),
        ),
        20.horizontalSpace,
      ]),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: context.width,
          child: Row(
            children: List.generate(3, (index) {
              return Expanded(
                child: BlocBuilder<NormalGameCubit, NormalGameState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      initial: () => Image.asset(Assets.images.langur.path),
                      orElse: () => Container(),
                      loading: () => Image.asset(Assets.images.video.path),
                      success: (pathIndex) {
                        return Image.asset(dice[pathIndex[index]]);
                      },
                    );
                  },
                ),
              );
            }),
          ),
        ),
        12.verticalSpace,
        SizedBox(
          width: context.width,
          child: Row(
            children: List.generate(3, (index) {
              return Expanded(
                child: BlocBuilder<NormalGameCubit, NormalGameState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      initial: () => Image.asset(Assets.images.langur.path),
                      orElse: () => Container(),
                      loading: () => Image.asset(Assets.images.video.path),
                      success: (pathIndex) {
                        return Image.asset(dice[pathIndex[index + 3]]);
                      },
                    );
                  },
                ),
              );
            }),
          ),
        ),
        30.verticalSpace,
        NoOfDices(dice: dice),
        40.verticalSpace,
        BlocBuilder<NormalGameCubit, NormalGameState>(
          builder: (context, state) {
            final loading = context.select<NormalGameCubit, bool>(
              (value) => value.state.maybeWhen(
                orElse: () => false,
                loading: () => true,
              ),
            );
            return CustomButton.text(
              label: "Roll",
              labelStyle: AppStyles.text16PxBold,
              isDisabled: loading,
              disabledColor: AppColors.textGrey,
              fullWidth: true,
              textColor: AppColors.white,
              backgroundColor: AppColors.primary,
              onPressed: () => context.read<NormalGameCubit>().manipulatedRolling(),
            );
          },
        ),
        10.verticalSpace,
      ]).px(20),
    );
  }
}

class NoOfDices extends StatelessWidget {
  const NoOfDices({
    super.key,
    required this.dice,
  });

  final List<String> dice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: BlocBuilder<NormalGameCubit, NormalGameState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => Container(),
            orElse: () => Container(),
            loading: () => const Center(child: Text("~ ~ ~ ~ ~ ~ ~ ~ ~ ~")),
            success: (pathIndex) {
              int countOf3 = pathIndex.where((element) => element == 3).length;
              int countOf5 = pathIndex.where((element) => element == 5).length;
              int countOf1 = pathIndex.where((element) => element == 1).length;
              int countOf4 = pathIndex.where((element) => element == 4).length;
              int countOf2 = pathIndex.where((element) => element == 2).length;
              int countOf0 = pathIndex.where((element) => element == 0).length;
              List<int> counts = [countOf0, countOf1, countOf2, countOf3, countOf4, countOf5];
              return Row(
                children: List.generate(
                  dice.length,
                  (index) => Expanded(
                    child: Row(
                      children: [
                        Image.asset(dice[index], height: 30),
                        const SizedBox(width: 2),
                        Text(counts[index].toString(), style: AppStyles.text16PxBold),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
