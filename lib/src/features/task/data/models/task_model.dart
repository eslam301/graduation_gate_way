class TaskModel {
  final int? id;
  final bool? isDone;
  final String? title;
  final String? description;
  final int? numWeekAdd;
  final int? numWeekDeadline;
  final int? numWeekFinish;

  TaskModel({
    this.id,
    this.isDone,
    this.title,
    this.description,
    this.numWeekAdd,
    this.numWeekDeadline,
    this.numWeekFinish,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['task_name'],
      description: json['description'],
      isDone: json['isDone'],
      numWeekAdd: json['numWeekAdd'],
      numWeekDeadline: json['numWeekDeadline'],
      numWeekFinish: json['numWeekfinish'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'task_name': title,
        'description': description,
        'isDone': isDone,
        'numWeekAdd': numWeekAdd,
        'numWeekDeadline': numWeekDeadline,
        'numWeekfinish': numWeekFinish,
      };

  TaskModel copyWith({
    int? id,
    int? numWeekAdd,
    int? numWeekDeadline,
    int? numWeekFinish,
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
      numWeekAdd: numWeekAdd ?? this.numWeekAdd,
      numWeekDeadline: numWeekDeadline ?? this.numWeekDeadline,
      numWeekFinish: numWeekFinish ?? this.numWeekFinish,
    );
  }
}
