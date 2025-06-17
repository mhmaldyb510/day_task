class TaskModel {
  final String title ;
  final String id;
  final List<String> collaborators;
  final String description;
  final DateTime startDate;
  final List<SubTaskModel> subTasks;


  TaskModel({
    this.title = '',
    this.id = '',
    this.collaborators = const [],
     this.description = '',
     required this.startDate,
    this.subTasks = const [],
  });
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      collaborators: json['collaborators'],
      description: json['description'],
      startDate: json['startDate'],
      subTasks: json['subTasks'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'collaborators': collaborators,
      'description': description,
      'startDate': startDate,
      'subTasks': subTasks,
    };
  }
}

class SubTaskModel {
  final String title;
  final String id;
   bool isCompleted;
  final String taskId;

  SubTaskModel({
    this.title = '',
    this.id = '',
    this.isCompleted = false,
    required this.taskId,
  });
  
}

