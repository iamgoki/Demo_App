class PirateModel {
  List<Data>? data;

  PirateModel({this.data});

  PirateModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  List<Members>? members;

  Data({this.id, this.name, this.members});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    if (json['Members'] != null) {
      members = <Members>[];
      json['Members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    if (this.members != null) {
      data['Members'] = this.members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
  String? name;
  String? image;
  String? description;
  String? role;
  String? origin;
  String? bounty;
  String? devilFruit;
  String? type;
  String? ability;
  String? haki;

  Members(
      {this.name,
      this.image,
      this.description,
      this.role,
      this.origin,
      this.bounty,
      this.devilFruit,
      this.type,
      this.ability,
      this.haki});

  Members.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    image = json['image'];
    description = json['Description'];
    role = json['Role'];
    origin = json['Origin'];
    bounty = json['Bounty'];
    devilFruit = json['Devil Fruit'];
    type = json['Type'];
    ability = json['Ability'];
    haki = json['Haki'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['image'] = this.image;
    data['Description'] = this.description;
    data['Role'] = this.role;
    data['Origin'] = this.origin;
    data['Bounty'] = this.bounty;
    data['Devil Fruit'] = this.devilFruit;
    data['Type'] = this.type;
    data['Ability'] = this.ability;
    data['Haki'] = this.haki;
    return data;
  }
}
