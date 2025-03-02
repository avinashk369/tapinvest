part of 'instrument_bloc.dart';

@freezed
class InstrumentState with _$InstrumentState {
  const factory InstrumentState.initial() = InstrumentInitial;
  const factory InstrumentState.loading() = InstrumentLoading;
  const factory InstrumentState.loaded({required BondDetail bondDetail}) =
      InstrumentLoaded;
  const factory InstrumentState.error({required String error}) =
      InstrumentError;
  const factory InstrumentState.currentTab({@Default(0) int tabIndex}) =
      InstrumentCurrentTab;
  const factory InstrumentState.currentChart({
    @Default(ChartType.ebitda) ChartType chartType,
  }) = InstrumentCurrentChart;
}
