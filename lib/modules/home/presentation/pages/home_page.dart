import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_firestore/modules/home/domain/dto/store_task_dto.dart';
import 'package:list_firestore/modules/home/domain/entities/task.dart';
import 'package:list_firestore/modules/home/presentation/controller/task_cubit.dart';
import 'package:list_firestore/modules/home/presentation/widgets/add_task_bottomsheet.dart';

import '../../../../core/widgets/bottom_sheet_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final taskCubit = Modular.get<TaskCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BottomSheetManager.showBottomSheetModal(
            context: context,
            content: AddTaskBottomSheet(
              onSave: (title, description) {
                final dto = StoreTaskDTO(
                    task: Task(
                  title: title,
                  description: description,
                  created: DateTime.now(),
                ));
                taskCubit.saveTask(dto);
                Modular.to.maybePop();
              },
            ),
          );
          // taskCubit.saveTask(
          //   StoreTaskDTO(
          //     task: Task(
          //       id: 'teste',
          //       title: 'teste titulo',
          //       description: 'teste descriçao',
          //       created: DateTime.now(),
          //       updated: DateTime.now(),
          //     ),
          //   ),
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
