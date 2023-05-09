part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotAndNewData> hotAndNewData,
    required List<HotAndNewData> comingSoonData,
    required bool isLoading,
    required bool isError,
  }) = _HotAndNewState;
  factory HotAndNewState.initial() => const HotAndNewState(
        comingSoonData: [],
        hotAndNewData: [],
        isError: false,
        isLoading: false,
      );
}
