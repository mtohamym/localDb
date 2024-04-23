class FoodModel {
  bool? status;
  List<Data>? data;

  FoodModel({this.status, this.data});

  FoodModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? price;
  String? restaurentId;
  String? catId;
  String? pic;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.restaurentId,
        this.catId,
        this.pic,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    restaurentId = json['restaurent_id'];
    catId = json['cat_id'];
    pic = json['pic'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['restaurent_id'] = this.restaurentId;
    data['cat_id'] = this.catId;
    data['pic'] = this.pic;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
