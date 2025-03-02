part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;
  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.loaded({
    required List<BondsModel> bonds,
    required List<BondsModel> filterBonds,
  }) = BondsLoaded;
  const factory HomeState.error({required String error}) = HomeError;
}
