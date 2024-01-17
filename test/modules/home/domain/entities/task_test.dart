import 'package:flutter_test/flutter_test.dart';
import 'package:list_firestore/modules/home/domain/entities/task.dart';

void main() {
  test('Task initialization', () {
    // Arrange
    Task myTask = Task(
      id: '1',
      title: 'Sample Task',
      description: 'This is a sample task description.',
      created: DateTime(2022, 1, 1),
    );

    // Act & Assert
    expect(myTask.id, '1');
    expect(myTask.title, 'Sample Task');
    expect(myTask.description, 'This is a sample task description.');
    expect(myTask.created, DateTime(2022, 1, 1));
    expect(myTask.updated, isNull);
  });

  test('Task update', () {
    // Arrange
    Task myTask = Task(
      id: '1',
      title: 'Sample Task',
      description: 'This is a sample task description.',
      created: DateTime(2022, 1, 1),
    );

    // Act
    myTask.updated = DateTime(2022, 2, 1);

    // Assert
    expect(myTask.updated, DateTime(2022, 2, 1));
  });
}
