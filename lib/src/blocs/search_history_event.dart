abstract class SearchHistoryEvent {}

class LoadHistoryEvent extends SearchHistoryEvent {}

class AddSearchToHistoryEvent extends SearchHistoryEvent {
  String searchTitle;

  AddSearchToHistoryEvent({required this.searchTitle});
}

class RemoveSearchFromHistoryEvent extends SearchHistoryEvent {
  int searchId;

  RemoveSearchFromHistoryEvent({required this.searchId});
}

class ClearSearchHistoryEvent extends SearchHistoryEvent {}
