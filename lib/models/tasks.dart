import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Tasks {
  DocumentReference _document;
  Tasks(DocumentReference<Map<String, dynamic>> doc):_document = doc;
  var uuid= const Uuid();
  List<Task> _innerList = <Task>[];

  int get length {
    return _innerList.length;
  }

  List<Task> get list =>_innerList;

  Future<void> update(Task task) async {
    assert(task != null && task.id != null);
    add(task);
  }

  Future<void> add(Task taskToCopy) async {
    Task task =Task.fromTask(taskToCopy);
    if (task.id == 'null' || task.id == '' || task.id == null) {
      String uniqueID = uuid.v1();
      print('generated unique id: ' + uniqueID);
      task.id = uniqueID;
      _innerList.add(task);
    }
    else {
      bool foundMatch = false;
      for(Task t in _innerList){
        if(t.id==task.id){
          foundMatch =true;
          break;
        }
      }
      if(!foundMatch){
        _innerList.add(task);
      }
    }
    return _document.set(task,SetOptions(merge: true));
  }

}
class Task {
  String? id;
  bool selected = false;
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