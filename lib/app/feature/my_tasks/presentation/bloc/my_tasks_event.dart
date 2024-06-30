
import 'package:equatable/equatable.dart';

class MyTasksEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthCheckEvent extends MyTasksEvent {
  @override
  List<Object?> get props => [];
}

class LoadMyTasksEvent extends MyTasksEvent {
  final String pageNumber;
  final bool? refresh;
  LoadMyTasksEvent({required this.pageNumber, this.refresh = false});
}

