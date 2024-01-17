class Task {
  String title;
  String description;
  DateTime? created;
  DateTime? updated;

  Task({
    required this.title,
    required this.description,
    this.created,
    this.updated,
  });
}
