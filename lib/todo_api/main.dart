import 'dart:convert';

import 'package:api_practice/todo_api/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http_client;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
@override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// DataModel? dataModel;
DataModel1? dataModel1;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
   /* getQuotes();*/
  getTodos();


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Featching data from (todo_api)"),
        centerTitle: true,
      ),
      body: dataModel1!=null && dataModel1!.todos.isNotEmpty ? ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20,),
        padding: EdgeInsets.all(12),// EdgeInsets.symmetric(horizontal: 12),
        itemCount: dataModel1!.todos.length,
        itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(color: Colors.blue.shade200,
              border: Border.all(width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12)),),
          child: ListTile(
            leading:  Text("${dataModel1!.todos[index].id}"),
                title: Text("${dataModel1!.todos[index].todo}"),
             // subtitle: Text("${dataModel1!.todos[index].completed}",style: TextStyle(fontWeight: FontWeight.bold),),
            trailing: SizedBox(width: 50,  child: Row(children: [dataModel1!.todos[index].completed ? Icon(Icons.done,color: Colors.green,) : Text("Pending",style: TextStyle(color: Colors.red),)     ],))//Text(dataModel1!.todos[index].completed ? "done" : "pending..")
              ), );
      },)  : Container(child: Center(child: Text("featching Todos...")),),

    );
  }

  void getTodos() async{
  var uri = Uri.parse("https://dummyjson.com/todos");
  var respose = await http_client.get(uri);

  print(respose);
  print(respose.statusCode);
  print(respose.body);

if(respose.statusCode==200 ){
  var mData = jsonDecode(respose.body);

  dataModel1 = DataModel1.fromjson(mData);
  setState(() {

  });

}


  }

}
