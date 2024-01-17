import 'package:equatable/equatable.dart';

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
  LoadedState();

  @override
  List<Object> get props => [];
}

class ErrorState extends TaskState {
  @override
  List<Object> get props => [];
}
