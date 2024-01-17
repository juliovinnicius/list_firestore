import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_firestore/modules/home/domain/usecases/delete_task_firestore_usecase.dart';
import 'package:list_firestore/modules/home/domain/usecases/get_all_tasks_firestore_usecase.dart';
import 'package:list_firestore/modules/home/domain/usecases/save_task_firestore_usecase.dart';
import 'package:list_firestore/modules/home/presentation/controller/task_cubit.dart';
import 'package:list_firestore/modules/home/presentation/pages/home_screen.dart';

import '../../../../core/widgets/bottom_sheet_manager.dart';
import '../../domain/dto/store_task_dto.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/edit_task_firestore_usecase.dart';
import '../widgets/add_task_bottomsheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final saveTaskFirestoreUsecase = Modular.get<ISaveTaskFirestoreUsecase>();
  final getAllTasksFirestoreUsecase =
      Modular.get<IGetAllTasksFirestoreUsecase>();
  final deleteTaskFirestoreUsecase = Modular.get<IDeleteTaskFirestoreUsecase>();
  final editTaskFirestoreUsecase = Modular.get<IEditTaskFirestoreUsecase>();

  final taskCubit = Modular.get<TaskCubit>();

  @override
  void initState() {
    taskCubit.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskCubit(
        saveTaskFirestoreUsecase: saveTaskFirestoreUsecase,
        getAllTasksFirestoreUsecase: getAllTasksFirestoreUsecase,
        deleteTaskFirestoreUsecase: deleteTaskFirestoreUsecase,
        editTaskFirestoreUsecase: editTaskFirestoreUsecase,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lista"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BottomSheetManager.showBottomSheetModal(
              context: context,
              content: AddTaskBottomSheet(
                onSave: (id, title, description) {
                  final dto = StoreTaskDTO(
                    task: Task(
                      id: id,
                      title: title,
                      description: description,
                      created: DateTime.now(),
                      updated: DateTime.now(),
                    ),
                  );
                  taskCubit.saveTask(dto);
                  taskCubit.getTasks();
                  Modular.to.maybePop();
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: const HomeScreen(),
      ),
    );
  }
}
