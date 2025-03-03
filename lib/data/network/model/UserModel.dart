
class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;
  bool favorite = false;

  UserModel(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company,
        this.favorite = false});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    company = json['company'] != null ? new Company.fromJson(json['company']) : null;
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

  static List<UserModel> fromMapList(dynamic mapList) {
    List<UserModel> list = [];

    for(int i = 0; i < mapList.length; i ++) {
      list.add(fromMap(mapList[i]));
    }

    return list;
  }

  static UserModel fromMap(Map<String, dynamic> map) {
     return UserModel(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      address: Address.fromJson(map['address']),
      phone: map['phone'],
      website: map['website'],
      company: Company.fromJson(map['company'])
    );
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      street = json['street'];
      suite = json['suite'];
      city = json['city'];
      zipcode = json['zipcode'];
      geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
    }
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

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
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

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      name = json['name'];
      catchPhrase = json['catchPhrase'];
      bs = json['bs'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}