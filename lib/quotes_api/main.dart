import 'dart:convert';

import 'package:api_practice/quotes_api/data_model.dart';
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
  DataModel? dataModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuotes();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Featching data from (.quotes_api)"),
        centerTitle: true,
      ),
      body: dataModel!=null && dataModel!.quotes.isNotEmpty ? ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20,),
        padding: EdgeInsets.all(12),// EdgeInsets.symmetric(horizontal: 12),
        itemCount: dataModel!.quotes.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(color: Colors.green.shade200,
              border: Border.all(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(12)),),
            child: ListTile(
              title: Text("${dataModel!.quotes[index].quote}"),
              subtitle: Text("${dataModel!.quotes[index].author}",style: TextStyle(fontWeight: FontWeight.bold),),
            ),


          );
        },)  : Container(child: Center(child: Text("featching Quotes...")),),

    );
  }

  void getQuotes() async{
    var uri = Uri.parse("https://dummyjson.com/quotes");

    var response = await http_client.get(uri);



    if(response.statusCode==200){
      var mData = jsonDecode(response.body);
      dataModel = DataModel.formjson(mData);
setState(() {

});
      print(dataModel);

    }

    print("code: ${response.statusCode}");
    print("body : ${response.body}");
  }

}
