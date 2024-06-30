

import 'package:equatable/equatable.dart';

import '../../data/models/my_tasks_response_model.dart';

class MyTasksEntity extends Equatable {
  final List<QueriesCount> queriesCount;
  final List<Query> queries;

  const MyTasksEntity({required this.queries, required this.queriesCount});

  @override
  List<Object?> get props => [queries, queriesCount];
}
