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

  final List<String> dice = [
    Assets.images.bhurja.path,
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
    if (pressedRollCount >= 5) {
      pressedRollCount = 0;
    } else {
      pressedRollCount++;
    }

    if (pressedRollCount == 4) {
      if (manipulateRollCount >= 6) {
        manipulateRollCount = 0;
      } else {
        manipulateRollCount++;
      }
      switch (manipulateRollCount) {
        case 1:
          int choosedListIndex = random.nextInt(5);
          List<List<int>> choosedList = [AllList.bhrujaList1, AllList.bhrujaList2, AllList.bhrujaList3, AllList.bhrujaList4, AllList.bhrujaList5];
          index = choosedList[choosedListIndex];
          break;
        case 2:
          int choosedListIndex = random.nextInt(5);
          List<List<int>> choosedList = [AllList.langurList1, AllList.langurList2, AllList.langurList3, AllList.langurList4, AllList.langurList5];
          index = choosedList[choosedListIndex];
          break;
        case 3:
          int choosedListIndex = random.nextInt(5);
          List<List<int>> choosedList = [AllList.heartList1, AllList.heartList2, AllList.heartList3, AllList.heartList4, AllList.heartList5];
          index = choosedList[choosedListIndex];
          break;
        case 4:
          int choosedListIndex = random.nextInt(5);
          List<List<int>> choosedList = [AllList.itaList1, AllList.itaList2, AllList.itaList3, AllList.itaList4, AllList.itaList5];
          index = choosedList[choosedListIndex];
          break;
        case 5:
          int choosedListIndex = random.nextInt(5);
          List<List<int>> choosedList = [AllList.suratList1, AllList.suratList2, AllList.suratList3, AllList.suratList4, AllList.suratList5];
          index = choosedList[choosedListIndex];
          break;
        case 6:
          int choosedListIndex = random.nextInt(5);
          List<List<int>> choosedList = [AllList.chiriList1, AllList.chiriList2, AllList.chiriList3, AllList.chiriList4, AllList.chiriList5];
          index = choosedList[choosedListIndex];
          break;
      }
      print(manipulateRollCount);
      pressedRollCount = 0;
    } else {
      for (int i = 0; i < 6; i++) {
        index[i] = random.nextInt(6);
      }
    }

    Timer(const Duration(milliseconds: 1500), () {
      emit(NormalGameState.success(pathIndex: index));
    });
  }
}
