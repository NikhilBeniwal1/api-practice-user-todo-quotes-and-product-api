

class DataModel {
  int limit;
  int skip;
  int total;
List<QuoteModel> quotes;

  DataModel({
   required this.limit,
   required this.skip,
   required this.total,
   required this.quotes
  });

  factory DataModel.formjson(Map<String,dynamic>  json){
List<QuoteModel> listQuotes = [];
for(Map<String,dynamic> eachMap in json["quotes"]){
var eachQuote = QuoteModel.fromjson(eachMap);

listQuotes.add(eachQuote);
}

    return DataModel(
        limit: json['limit'],
        skip: json["skip"],
        total: json["total"],
        quotes: listQuotes,
    );

  }





}


class QuoteModel {
  int id;
  String quote;
  String author;

  QuoteModel({required this.id,
    required this.quote,
    required this.author});

  factory QuoteModel.fromjson (Map<String,dynamic> json){

    return QuoteModel(
        id: json["id"],
        quote: json["quote"],
        author: json["author"],
    );



  }



}