part of 'instrument_bloc.dart';

@freezed
class InstrumentEvent with _$InstrumentEvent {
  const factory InstrumentEvent.getInstrument() = GetInstrument;
  const factory InstrumentEvent.changeTab({@Default(0) int tabIndex}) =
      ChangeInstrumentTab;
  const factory InstrumentEvent.changeChart({
    @Default(ChartType.ebitda) ChartType chartType,
  }) = ChangeChart;
}
