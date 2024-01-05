import 'dart:convert';


import 'package:api_practice/users_api/users_api.dart';
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
DataModelUsers? dataModelUsers;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
   /* getQuotes();*/
//  getProducts();
getusers();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Featching data. from Users Api"),
        centerTitle: true,
      ),
      body: dataModelUsers!=null && dataModelUsers!.users!.isNotEmpty ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in a row
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemCount: dataModelUsers!.users!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3,
            child: Column(
              children: [
                SizedBox(height: 20,),
                SizedBox(height: 120,width: 120, child: SizedBox(width: 80, height: 80, child: Image.network(dataModelUsers!.users![index].image!))),
                Text("Name: ${dataModelUsers!.users![index].firstName!}"),
                Text("Age: ${dataModelUsers!.users![index].age!}"),
                Text("Address: ${dataModelUsers!.users![index].address!.address!}"),
                // Text("Email: ${dataModelUsers!.users![index].email!}"),

              ]
            ),
          );
        },
      )  : Container(child: Center(child: Text("featching Users data...")),),

    );
  }

  void getusers() async{
  var uri = Uri.parse("https://dummyjson.com/users");
  var respose = await http_client.get(uri);

  print(respose);
  print(respose.statusCode);
  print(respose.body);

if(respose.statusCode==200 ){
  var mData = jsonDecode(respose.body);

  dataModelUsers = DataModelUsers.fromjson(mData);
  setState(() {

  });

}


  }

}


class ProductInfo extends StatefulWidget {


  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [

    ],),);
  }
}

