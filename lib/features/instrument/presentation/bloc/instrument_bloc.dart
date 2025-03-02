import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tapinvest/core/errors/server_error.dart';
import 'package:tapinvest/core/utils/error_const.dart';
import 'package:tapinvest/features/instrument/data/chart_type.dart';
import 'package:tapinvest/features/instrument/data/model/bond_detail.dart';
import 'package:tapinvest/features/instrument/domain/repository/instrument_repository.dart';
part 'instrument_bloc.freezed.dart';
part 'instrument_state.dart';
part 'instrument_event.dart';

@injectable
class InstrumentBloc extends Bloc<InstrumentEvent, InstrumentState> {
  final InstrumentRepository instrumentRepository;
  InstrumentBloc({required this.instrumentRepository})
    : super(InstrumentInitial()) {
    on<InstrumentEvent>((event, emit) async {
      await event.map(
        getInstrument: (event) async => await _getInstrumentDetail(event, emit),
        changeTab: (event) async => await _changeInstrumentTab(event, emit),
        changeChart: (event) async => await _changeChart(event, emit),
      );
    });
  }

  /// fetch instrument/bond detail
  Future<void> _getInstrumentDetail(
    GetInstrument event,
    Emitter<InstrumentState> emit,
  ) async {
    try {
      emit(InstrumentLoading());
      emit(
        InstrumentLoaded(
          bondDetail: await instrumentRepository.getBondDetail(),
        ),
      );
    } on ServerError catch (error) {
      emit(InstrumentError(error: error.errorMessage));
    } catch (e) {
      emit(InstrumentError(error: ErrorConst.somethingWentWrong));
    }
  }

  /// change instrument tab
  Future<void> _changeInstrumentTab(
    ChangeInstrumentTab event,
    Emitter<InstrumentState> emit,
  ) async {
    emit(InstrumentCurrentTab(tabIndex: event.tabIndex));
  }

  /// change chart
  Future<void> _changeChart(
    ChangeChart event,
    Emitter<InstrumentState> emit,
  ) async {
    emit(InstrumentCurrentChart(chartType: event.chartType));
  }
}
