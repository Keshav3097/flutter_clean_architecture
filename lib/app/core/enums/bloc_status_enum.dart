enum BlocStatus { initial, success, error, loading, selected , isLoadMore}


extension CategoryStatusX on BlocStatus {
  bool get isLoadMore => this == BlocStatus.isLoadMore;
  bool get isInitial => this == BlocStatus.initial;
  bool get isSuccess => this == BlocStatus.success;
  bool get isError => this == BlocStatus.error;
  bool get isLoading => this == BlocStatus.loading;
}