


class User{
  int? id;
  String? name;
  int? age;
  String? address;

  userMap(){
    var map = <String,dynamic>{};
    map['id']=id;
    map['name']=name!;
    map['age']=age!;
    map['address']=address!;
    return map;
  }
}