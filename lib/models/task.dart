
class Task {
  String? id;
  final bool selected = false;
  String name = 'task name';
  String? description;
  int? noOfPomodoro;
  String priority = 'No Priority';
  bool completed = false;

  Task({this.id,required this.name,this.description,this.noOfPomodoro,required this.priority,required this.completed});

  Task.fromTask(Task t){
    id = t.id.toString();
    name = t.name.toString();
    description = t.description.toString();
    noOfPomodoro = t.noOfPomodoro;
    priority = t.priority.toString();
    completed = t.completed;
  }
  Task.fromJson(String key, Map<dynamic, dynamic> json) {
    //print('creating task with json: ' + json.toString());
    id = key;
    name = json['name'];
    description = json['description'];
    noOfPomodoro= json['noOfPomodoro'];
    priority = json['priority'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['noOfPomodoro'] = this.noOfPomodoro;
    data['priority'] = this.priority;
    data['completed'] = this.completed;

    final Map<String, dynamic> theTask = new Map<String, dynamic>();
    theTask[this.id!] = data;

    return theTask;
  }
}