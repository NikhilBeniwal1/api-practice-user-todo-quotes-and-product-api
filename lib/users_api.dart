
class DataModelUsers{
int?  limit;
int? total;
int? skip;
List<UserModel> users;

DataModelUsers({required this.limit,
  required this.total,
  required this.skip,
  required this.users});

factory DataModelUsers.fromjson(Map<String,dynamic> json){
  List<UserModel> listusers = [];
  for (Map<String,dynamic> eachuser in json['users']){

    listusers.add(UserModel.fromjson(eachuser));
  }

  return DataModelUsers(
      limit: json['limit'],
      total: json['total'],
      skip: json['skip'],
      users: listusers,
  );

}


}

class UserModel {
 int? age;
 String? birthDate;
 String? bloodGroup;
 String? ein;
 String? email;
 String? eyeColor;
 String? firstName;
 String? gender;
int? height;
int? id;
String? image;
String? ip;
String? lastName;
String? macAddress;
String? maidenName;
 String? password;
 String? phone;
 String? ssn;
 String? university;
 String? userAgent;
 String? username;
 String? domain;
 double? weight;
 HairModel? hair;
 addressModel?  address;
CompanyModel? company;
cryptoModel?  crypto;
bankModel? bank;
 UserModel(
      {required this.age,
        required this.birthDate,
        required this.bloodGroup,
        required this.ein,
        required this.email,
        required this.eyeColor,
        required this.firstName,
        required this.gender,
        required this.height,
        required  this.id,
        required this.image,
        required  this.ip,
        required  this.lastName,
        required  this.macAddress,
        required  this.maidenName,
        required  this.password,
        required  this.phone,
        required  this.ssn,
        required  this.university,
        required  this.userAgent,
        required  this.username,
        required  this.domain,
        required  this.weight,
        required this.hair,
        required    this.address,
        required    this.company,
        required    this.crypto,
        required    this.bank

      });

 factory UserModel.fromjson(Map<String,dynamic> json){

   return UserModel(age: json['age'],
       birthDate: json['birthDate'],
       bloodGroup: json['bloodGroup'],
       ein: json['ein'],
       email: json['email'],
       eyeColor: json['eyeColor'],
       firstName: json['firstName'],
       gender: json['gender'],
       height: json['height'],
       id: json['id'],
       image: json['image'],
       ip: json['ip'],
       lastName: json['lastName'],
       macAddress: json['macAddress'],
       maidenName: json['maidenName'],
       password: json['password'],
     phone: json['phone'],
       ssn: json['ssn'],
       university: json['university'],
       userAgent: json['userAgent'],
       username: json['username'],
       domain: json['domain'],
       weight: json['weight'],
       hair: HairModel.fromjson(json['hair']),
       address: addressModel.fromjson(json['address']),
       company: CompanyModel.fromjson(json['company']),
       crypto: cryptoModel.fromjson(json['crypto']),
   bank: bankModel.fromjson(json['bank']),

   );

 }



}


class HairModel{
 String? color;
 String? type;

 HairModel({required this.color, required this.type});
 factory HairModel.fromjson(Map<String,dynamic> json){

   return HairModel(color: json['color'], type: json['type']);
 }

}

class bankModel{
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  bankModel({
        required this.cardExpire,
        required this.cardNumber,
        required this.cardType,
        required this.currency,
        required this.iban
      });
  factory bankModel.fromjson(Map<String,dynamic> json ){
    return bankModel(cardExpire: json['cardExpire'],
        cardNumber: json['cardNumber'],
        cardType: json['cardType'],
        currency: json['currency'],
        iban: json['iban']
    );
  }


}


class cryptoModel{

 String? coin;
 String? network;
 String? wallet;

 cryptoModel({required this.coin,
   required this.network,
   required this.wallet});

 factory cryptoModel.fromjson(Map<String,dynamic> json){
   return cryptoModel(
       coin: json['coin'],
       network: json['network'],
       wallet: json['wallet']
   );


 }

}


class CompanyModel{
 addressModel? address;
 String? department;
 String? name;
 String? title;

 CompanyModel({
   required this.address,
   required this.department,
   required this.name,
   required this.title
 });

 factory CompanyModel.fromjson(Map<String,dynamic> json){


   return CompanyModel(
       address: addressModel.fromjson(json["address"]),
       department: json['department'],
       name: json['name'],
       title: json['title'],
   );

 }


}


class addressModel {
  String? address;
  String? city;
  CoordinatesModel? coordinates;
  String? postalCode;
  String? state;

  addressModel({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state,
  });

  factory addressModel.fromjson(Map<String,dynamic> json){

    return addressModel(
        address: json["address"],
        city: json['city'],
        coordinates: CoordinatesModel.fromjson(json['coordinates']),  //give coordinates model here
        postalCode: json['postalCode'],
        state: json['state']
    );
  }


}


class  CoordinatesModel{
  double? lat;
  double? lng;

  CoordinatesModel({
    required this.lat,
    required this.lng,
  });

  factory CoordinatesModel.fromjson(Map<dynamic,dynamic> json){

    return CoordinatesModel(
      lat: json['lat'],
      lng: json['lng'],
    );

  }


}
