
import 'package:assessment_project/data/network/model/UserModel.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'UsersApi.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class UsersApi {
  factory UsersApi(Dio dio, {String baseUrl}) = _UsersApi;

  @GET('/Users')
  Future<List<User>> fetchUsers();
}

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;
  bool? favorite;

  User(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company,
        this.favorite});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    company = json['company'] != null ? new Company.fromJson(json['company']) : null;
    favorite = false;
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
      'username' : username,
      'email' : email,
      'address' : address?.toJson(),
      'phone' : phone,
      'website' : website,
      'company' : company?.toJson()
    };
  }
}

class UserAddress {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  UserAddress({this.street, this.suite, this.city, this.zipcode, this.geo});

  UserAddress.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    if (geo != null) {
      data['geo'] = geo!.toJson();
    }
    return data;
  }

}

class UserGeo {
  String? lat;
  String? lng;

  UserGeo({this.lat, this.lng});

  UserGeo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }

}

class UserCompany {
  String? name;
  String? catchPhrase;
  String? bs;

  UserCompany({this.name, this.catchPhrase, this.bs});

  UserCompany.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}