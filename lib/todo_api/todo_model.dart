class DataModel1{
List<TodoModel> todos;
int total;
int skip;
int limit;

DataModel1({
  required this.todos,
  required this.total,
  required this.skip,
  required this.limit,
});

factory DataModel1.fromjson(Map<String,dynamic> json) {
  List<TodoModel> listtodos = [];
  for(Map<String,dynamic> eachMap in json["todos"]){
    var eachtodo = TodoModel.fromjson(eachMap);

    listtodos.add(eachtodo);



  }



  return DataModel1(
      total: json["total"],
      skip: json['skip'],
      limit: json["limit"],
      todos: listtodos,
  );

}


}

class TodoModel{
int id;
String todo;
bool completed;
int userId;


TodoModel({
  required this.id,
  required this.todo,
  required this.completed,
  required this.userId,


});


factory TodoModel.fromjson(Map<String,dynamic> json){


  return TodoModel(
      id: json["id"],
      todo: json["todo"],
      completed: json["completed"],
      userId: json["userId"],

  );

}

}



