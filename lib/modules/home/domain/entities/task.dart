class Task {
  String id;
  String title;
  String description;
  DateTime? created;
  DateTime? updated;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.created,
    this.updated,
  });
}
