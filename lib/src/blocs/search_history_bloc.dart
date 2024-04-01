import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minha_busca_Atak/src/blocs/search_history_event.dart';
import 'package:minha_busca_Atak/src/blocs/search_history_state.dart';

import '../data/local/search_history_repository_impl.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  final _searchHistoryRepository = SearchHistoryRepositoryImpl();

  SearchHistoryBloc() : super(SearchHistoryInitialState()) {
    on<LoadHistoryEvent>((event, emit) async => emit(SearchHistorySuccessState(
        searchHistory: await _searchHistoryRepository.loadHistory())));

    on<AddSearchToHistoryEvent>((event, emit) async => emit(
        SearchHistorySuccessState(
            searchHistory: await _searchHistoryRepository
                .addSearchToHistory(event.searchTitle))));

    on<RemoveSearchFromHistoryEvent>((event, emit) async => emit(
        SearchHistorySuccessState(
            searchHistory: await _searchHistoryRepository
                .removeSearchFromHistory(event.searchId))));

    on<ClearSearchHistoryEvent>((event, emit) async => emit(
        SearchHistorySuccessState(
            searchHistory: await _searchHistoryRepository.clearHistory())));
  }
}
