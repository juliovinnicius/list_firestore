// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:list_firestore/modules/home/domain/entities/task.dart';

typedef OnSaveTaskCallBack = void Function(
  String id,
  String title,
  String description,
  DateTime created,
  DateTime update,
);

class EditTaskBottomSheet extends StatefulWidget {
  const EditTaskBottomSheet({
    super.key,
    required this.onSave,
    required this.task,
  });

  final OnSaveTaskCallBack onSave;
  final Task task;

  @override
  State<EditTaskBottomSheet> createState() => _EditTaskBottomSheetState();
}

class _EditTaskBottomSheetState extends State<EditTaskBottomSheet> {
  late final idController;
  late final titleController;
  late final descriptionController;

  @override
  void initState() {
    idController = TextEditingController(text: widget.task.id);
    titleController = TextEditingController(text: widget.task.title);
    descriptionController =
        TextEditingController(text: widget.task.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Adicionar uma tarefa',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Id',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: idController,
              // initialValue: /,
              readOnly: true,
              decoration: const InputDecoration(
                hintText: 'Coloque o id da tarefa',
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Titulo',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Coloque o titulo da tarefa',
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Descrição',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Coloque a descrição na tarefa',
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Sair'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Salvar'),
                    onPressed: () => widget.onSave(
                      idController.text,
                      titleController.text,
                      descriptionController.text,
                      widget.task.created!,
                      DateTime.now(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
