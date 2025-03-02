part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadBonds() = LoadBonds;
  const factory HomeEvent.searchBonds({required String search}) = SearchBonds;
}
