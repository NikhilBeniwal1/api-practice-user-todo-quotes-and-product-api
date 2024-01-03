class DataModelProduct{
  List<ProductsModel> products;
  int skip;
  int total;
  int limit;

  DataModelProduct({
    required this.products,
    required this.skip,
    required this.total,
    required this.limit,
});

 factory DataModelProduct.fromjson(Map<String,dynamic> json){
List<ProductsModel> listProducts = [];
for(Map<String,dynamic> eachProduct in json["products"] ){
  var listProduct = ProductsModel.fromjson(eachProduct);
  listProducts.add(listProduct);
}

//ProductsModel.fromjson(json['products']);

   return DataModelProduct(
       products: listProducts,
       skip: json['skip'],
       total: json['total'],
       limit: json['limit'], );

 }



}

class ProductsModel {

  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

 ProductsModel({
required this.id,
   required this.title,
   required this.description,
   required this.price,
   required this.discountPercentage,
   required this.rating,
   required this.stock,
   required this.brand,
   required this.category,
   required this.thumbnail,
   required this.images
 });

factory ProductsModel.fromjson(Map<String,dynamic> json){

  return ProductsModel(id: json["id"],
      title: json["title"],
      description: json['description'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json["rating"],
      stock: json["stock"],
      brand: json["brand"],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: (json["images"] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
  );

}




}