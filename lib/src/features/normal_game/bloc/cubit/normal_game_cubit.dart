import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:langurburja/src/core/assets/assets.gen.dart';

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
  List<int> index = [0, 0, 0, 0, 0, 0];
  void startRolling() async {
    emit(const NormalGameState.loading());
    final player = AudioPlayer();
    await player.play(UrlSource(Assets.sounds.diceroll));
    Random random = Random();
    for (int i = 0; i < 6; i++) {
      int a = random.nextInt(6);
      index[i] = random.nextInt(6);
    }
    Timer(const Duration(seconds: 1), () {
      emit(NormalGameState.success(pathIndex: index));
    });
  }
}
