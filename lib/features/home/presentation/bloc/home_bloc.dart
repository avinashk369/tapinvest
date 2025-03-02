import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tapinvest/core/errors/server_error.dart';
import 'package:tapinvest/core/utils/error_const.dart';
import 'package:tapinvest/features/home/data/model/bonds_model.dart';
import 'package:tapinvest/features/home/domain/repositories/home_repository.dart';
part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(const HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      await event.map(
        loadBonds: (event) async => _loadBonds(event, emit),
        searchBonds: (event) async => _searchBonds(event, emit),
      );
    });
  }

  /// load all the bonds
  Future _loadBonds(LoadBonds event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());

      /// call the repo function to load the bonds
      final List<BondsModel> bonds = await homeRepository.loadBonds();

      /// emit bonds loaded state with data

      emit(BondsLoaded(bonds: bonds, filterBonds: bonds));
    } on ServerError catch (error) {
      emit(HomeError(error: error.errorMessage));
    } catch (e) {
      /// emit error state
      emit(HomeError(error: ErrorConst.somethingWentWrong));
    }
  }

  /// search bonds
  Future _searchBonds(SearchBonds event, Emitter<HomeState> emit) async {
    try {
      final state = this.state;

      if (state is! BondsLoaded) {
        return;
      }
      final allBonds = state.bonds;

      if (event.search.isEmpty) {
        emit(state.copyWith(bonds: allBonds, filterBonds: allBonds));
        return;
      }

      // Filter bonds based on the search query

      final List<BondsModel> filteredBonds =
          allBonds
              .where(
                (bond) =>
                    (bond.isin?.toLowerCase().contains(
                          event.search.toLowerCase(),
                        ) ==
                        true) ||
                    (bond.companyName?.toLowerCase().contains(
                          event.search.toLowerCase(),
                        ) ==
                        true),
              )
              .toList();

      // Emit the new state with filtered bonds
      emit(state.copyWith(bonds: allBonds, filterBonds: filteredBonds));
    } catch (_) {}
  }
}
