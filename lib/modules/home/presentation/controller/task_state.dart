import 'package:equatable/equatable.dart';
import 'package:list_firestore/modules/home/domain/entities/task.dart';

abstract class TaskState extends Equatable {}

class InitialState extends TaskState {
  @override
  List<Object> get props => [];
}

class LoadingState extends TaskState {
  @override
  List<Object> get props => [];
}

class LoadedState extends TaskState {
  LoadedState(this.list);

  final List<Task> list;

  @override
  List<Object> get props => [list];
}

class ErrorState extends TaskState {
  @override
  List<Object> get props => [];
}
