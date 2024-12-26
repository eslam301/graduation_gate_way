class TaskModel {
  final int id;
  final bool isDone;
  final String title;
  final String description;
  final DateTime date;

  TaskModel({
    required this.id,
    required this.isDone,
    required this.title,
    required this.description,
    required this.date,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      isDone: json['isDone'],
      title: json['title'],
      description: json['description'],
      date:
          json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
    );
  }

  TaskModel copyWith({
    int? id,
    bool? isDone,
    String? title,
    String? description,
    String? date,
  }) {
    return TaskModel(
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date != null ? DateTime.parse(date) : this.date,
    );
  }
}
