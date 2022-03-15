class Employee{
  String name ;
  Address address;
  int id;
  String username;
  String email;
  String profile_image;
  String phone ;
  String website ;
  //Company company;


  Employee({
    required this.name,
    required this.address,
    required this.id,
    required this.username,
    required this.email,
    required this.profile_image,
    required this.phone,
    required this.website,
    //required this.company,

  });

  factory Employee.fromJson(Map<String, dynamic> parsedJson){
    return Employee(
        name: parsedJson['name'] ?? "",
        id: parsedJson['id'] ?? 0,
        username: parsedJson['username'] ?? "",
        email: parsedJson['email'],
        profile_image: parsedJson['profile_image'] ?? "",
        phone: parsedJson['phone']?? "",
        website: parsedJson['website'] ?? "",
        address: Address.fromJson(parsedJson['address'] ?? ""),
       // company: Company.fromJson(parsedJson['company'] ?? "")

    );
  }
}

class Address{
  String street;
  String suite;
  String city;
  String zipcode;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode
  });

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
        street: json['street'] ?? "",
        suite: json['suite'] ?? "",
        city: json['city'] ?? "",
        zipcode: json['zipcode'] ?? ""
    );
  }
}
class Company{
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json){
    return Company(
      name: json['name'] ?? "",
      catchPhrase: json['catchPhrase'] ?? "",
      bs: json['bs'] ?? "",
    );
  }
}

