import 'package:bloc/bloc.dart';
import 'package:list_firestore/modules/home/domain/dto/store_task_dto.dart';
import 'package:list_firestore/modules/home/domain/usecases/delete_task_firestore_usecase.dart';
import 'package:list_firestore/modules/home/domain/usecases/get_all_tasks_firestore_usecase.dart';
import 'package:list_firestore/modules/home/presentation/controller/task_state.dart';

import '../../domain/entities/task.dart';
import '../../domain/usecases/edit_task_firestore_usecase.dart';
import '../../domain/usecases/save_task_firestore_usecase.dart';

class TaskCubit extends Cubit<TaskState> {
  final ISaveTaskFirestoreUsecase saveTaskFirestoreUsecase;
  final IGetAllTasksFirestoreUsecase getAllTasksFirestoreUsecase;
  final IDeleteTaskFirestoreUsecase deleteTaskFirestoreUsecase;
  final IEditTaskFirestoreUsecase editTaskFirestoreUsecase;

  TaskCubit({
    required this.saveTaskFirestoreUsecase,
    required this.getAllTasksFirestoreUsecase,
    required this.deleteTaskFirestoreUsecase,
    required this.editTaskFirestoreUsecase,
  }) : super(InitialState());

  late List<Task> listTask;

  void saveTask(StoreTaskDTO dto) async {
    emit(LoadingState());

    final result = await saveTaskFirestoreUsecase(dto);

    result.fold(
      (success) {
        return emit(LoadedState(listTask));
      },
      (failure) {
        return emit(ErrorState());
      },
    );
  }

  Future<void> getTasks() async {
    emit(LoadingState());

    final result = await getAllTasksFirestoreUsecase();

    result.fold(
      (success) {
        listTask = [...success];
        return emit(LoadedState(success));
      },
      (failure) {
        return emit(ErrorState());
      },
    );
  }

  Future<void> deleteTask(StoreTaskDTO dto) async {
    emit(LoadingState());

    final result = await deleteTaskFirestoreUsecase(dto);

    result.fold(
      (success) {
        return emit(LoadedState(listTask));
      },
      (failure) {
        return emit(ErrorState());
      },
    );
  }

  Future<void> editTask(StoreTaskDTO dto) async {
    emit(LoadingState());

    final result = await editTaskFirestoreUsecase(dto);

    result.fold(
      (success) {
        return emit(LoadedState(listTask));
      },
      (failure) {
        return emit(ErrorState());
      },
    );
  }
}
