part of 'normal_game_cubit.dart';

@freezed
class NormalGameState with _$NormalGameState {
  const factory NormalGameState.initial() = _Initial;

  const factory NormalGameState.loading() = _Loading;

  const factory NormalGameState.error({required String message}) = _Error;

  const factory NormalGameState.success({required List<int> pathIndex}) = _Success;
}
