import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_firestore/modules/home/domain/dto/store_task_dto.dart';
import 'package:list_firestore/modules/home/domain/entities/task.dart';
import 'package:list_firestore/modules/home/presentation/controller/task_cubit.dart';
import 'package:list_firestore/modules/home/presentation/controller/task_state.dart';
import 'package:list_firestore/modules/home/presentation/widgets/edit_task_bottomsheet.dart';

import '../../../../core/extension/date_formatter.dart';
import '../../../../core/widgets/bottom_sheet_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskCubit = Modular.get<TaskCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      bloc: taskCubit,
      builder: (context, state) {
        if (state is InitialState) {
          return Container();
        }

        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black87,
            ),
          );
        }

        if (state is ErrorState) {
          return const Center(
            child: Text('Não tem tarefa cadastrada'),
          );
        }

        final list = (state as LoadedState).list;
        return Scaffold(
          body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final task = list[index];
              return ListTile(
                title: Text(task.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.description),
                    if (task.created != null)
                      Text('Data de criação: ${task.created!.asBrazilDate()}'),
                    if (task.updated != null)
                      Text(
                          'Data de atualização: ${task.updated!.asBrazilDate()}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        BottomSheetManager.showBottomSheetModal(
                          context: context,
                          content: EditTaskBottomSheet(
                            task: task,
                            onSave: (
                              id,
                              title,
                              description,
                              created,
                              update,
                            ) {
                              final dto = StoreTaskDTO(
                                task: Task(
                                  id: id,
                                  title: title,
                                  description: description,
                                  created: created,
                                  updated: update,
                                ),
                              );
                              taskCubit.editTask(dto);
                              taskCubit.getTasks();
                              Modular.to.maybePop();
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await taskCubit.deleteTask(
                          StoreTaskDTO(
                            task: Task(
                              id: task.id,
                              title: task.title,
                              description: task.description,
                              created: DateTime.now(),
                              updated: DateTime.now(),
                            ),
                          ),
                        );
                        await taskCubit.getTasks();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
