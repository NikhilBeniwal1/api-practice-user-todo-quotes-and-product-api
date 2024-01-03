import 'dart:convert';



import 'package:api_practice/product_api/product_api.dart';
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
DataModelProduct? dataModelProduct;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
   /* getQuotes();*/
  getProducts();


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Featching data. from product api"),
        centerTitle: true,
      ),
      body: dataModelProduct!=null && dataModelProduct!.products.isNotEmpty ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in a row
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemCount: dataModelProduct!.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3,
            child: Column(
              children: [
                SizedBox(height: 120,width: 120, child: Image.network(dataModelProduct!.products[index].thumbnail)),
                Text("Price: ${dataModelProduct!.products[index].price}"),
                Text("BrandName: ${dataModelProduct!.products[index].brand}"),
                Text("Category: ${dataModelProduct!.products[index].category}"),
                Text("Rating: ${dataModelProduct!.products[index].rating}"),

              ]
            ),
          );
        },
      )  : Container(child: Center(child: Text("featching Todos...")),),

    );
  }

  void getProducts() async{
  var uri = Uri.parse("https://dummyjson.com/products");
  var respose = await http_client.get(uri);

  print(respose);
  print(respose.statusCode);
  print(respose.body);

if(respose.statusCode==200 ){
  var mData = jsonDecode(respose.body);

  dataModelProduct = DataModelProduct.fromjson(mData);
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

