class TaskModel {
  final String title ;
  final List<String> collaborators;
  final String description;
  final DateTime startDate;
  List<String> completed ;
  List<String> notCompleted ;

  TaskModel({
    this.title = '',
    this.collaborators = const [],
     this.description = '',
     required this.startDate,
     this.completed = const [],
     this.notCompleted = const  [],
  });
}
