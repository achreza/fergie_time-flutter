// ignore_for_file: unnecessary_this, unused_element, prefer_collection_literals

class Comp {
  String logo, name, idComp;
  Comp({this.logo, this.name, this.idComp});

  Comp.fromMap(Map<String, dynamic> map) {
    this.logo = map['logo'];
    this.name = map['name'];
    this.idComp = map['idComp'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['logo'] = this.logo;
    map['name'] = this.name;
    map['idComp'] = this.idComp;
    return map;
  }
}
