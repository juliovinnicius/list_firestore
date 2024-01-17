import 'package:bloc/bloc.dart';
import 'package:list_firestore/modules/home/domain/dto/store_task_dto.dart';
import 'package:list_firestore/modules/home/presentation/controller/task_state.dart';

import '../../domain/usecases/save_task_firestore_usecase.dart';

class TaskCubit extends Cubit<TaskState> {
  final ISaveTaskFirestoreUsecase saveTaskFirestoreUsecase;

  TaskCubit({required this.saveTaskFirestoreUsecase}) : super(InitialState());

  void saveTask(StoreTaskDTO dto) async {
    emit(LoadingState());

    final result = await saveTaskFirestoreUsecase(dto);

    result.fold(
      (success) {
        return emit(LoadedState());
      },
      (failure) {
        return emit(ErrorState());
      },
    );
  }
}
