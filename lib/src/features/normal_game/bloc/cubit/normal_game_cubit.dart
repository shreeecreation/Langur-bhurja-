import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:langurburja/src/core/assets/assets.gen.dart';
import 'package:langurburja/src/features/manipulated_game/helper/helper_list/lists.dart';

part 'normal_game_cubit.freezed.dart';
part 'normal_game_state.dart';

class NormalGameCubit extends Cubit<NormalGameState> {
  NormalGameCubit() : super(const NormalGameState.initial());

  final List<String> dice = [     Assets.images.bhurja.path,
    Assets.images.langur.path,
    Assets.images.heart.path,
    Assets.images.ita.path,
    Assets.images.surat.path,
    Assets.images.chiri.path
  ];

  int pressedRollCount = 0;
  int manipulateRollCount = 0;

  List<int> index = [0, 0, 0, 0, 0, 0];
  void startRolling() async {
    emit(const NormalGameState.loading());
    final player = AudioPlayer();
    await player.play(
      AssetSource("sounds/diceroll.mp3"),
    );
    Random random = Random();
    for (int i = 0; i < 6; i++) {
      index[i] = random.nextInt(6);
    }
    Timer(const Duration(milliseconds: 1500), () {
      emit(NormalGameState.success(pathIndex: index));
    });
  }

  void manipulatedRolling() async {
    emit(const NormalGameState.loading());
    final player = AudioPlayer();
    await player.play(
      AssetSource("sounds/diceroll.mp3"),
    );
    Random random = Random();
    if (pressedRollCount > 5) {
      pressedRollCount = 0;
    } else {
      pressedRollCount++;
    }

    for (int i = 0; i < 6; i++) {
      if (pressedRollCount == random.nextInt(3) + 3 && pressedRollCount > 3) {
        if (manipulateRollCount > 5) {
          manipulateRollCount = 0;
        } else {
          manipulateRollCount++;
        }
        switch(manipulateRollCount)
        {
          case 1:
          int choosedListIndex = random.nextInt(5);
        List<int> choosedList = [...AllList.bhrujaList1, ]
          index[i] = 
        }
        index[i] = random.nextInt( 5 - manipulateRollCount);
        print(index);
        pressedRollCount = 0;
      } else {
        index[i] = random.nextInt(6);
      }
    }
    print(manipulateRollCount);
    print(pressedRollCount);
    Timer(const Duration(milliseconds: 1500), () {
      emit(NormalGameState.success(pathIndex: index));
    });
  }
}
