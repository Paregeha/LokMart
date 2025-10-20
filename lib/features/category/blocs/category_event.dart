abstract class CategoryEvent {}

class CategoryFetchRequested extends CategoryEvent {
  CategoryFetchRequested({this.forceRefresh = false});
  final bool forceRefresh;
}

class CategoryRefreshed extends CategoryEvent {}
