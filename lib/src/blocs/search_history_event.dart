abstract class SearchHistoryEvent {}

class LoadHistoryEvent extends SearchHistoryEvent {}

class AddSearchToHistoryEvent extends SearchHistoryEvent {
  String search;

  AddSearchToHistoryEvent({required this.search});
}

class RemoveSearchFromHistoryEvent extends SearchHistoryEvent {
  String search;

  RemoveSearchFromHistoryEvent({required this.search});
}

class ClearResultsEvent extends SearchHistoryEvent {}
