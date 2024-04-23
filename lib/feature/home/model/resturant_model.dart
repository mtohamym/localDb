class ResturantModel {
  bool? status;
  List<Data>? data;

  ResturantModel({this.status, this.data});

  ResturantModel.fromJson(Map<String, dynamic> json) {
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
  String? pic;
  String? coverPhoto;
  String? name;
  String? deliveryTime;
  String? tags1;
  String? tags2;
  String? verified;
  String? lat;
  String? long;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.pic,
        this.coverPhoto,
        this.name,
        this.deliveryTime,
        this.tags1,
        this.tags2,
        this.verified,
        this.lat,
        this.long,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pic = json['pic'];
    coverPhoto = json['cover_photo'];
    name = json['name'];
    deliveryTime = json['delivery_time'];
    tags1 = json['tags1'];
    tags2 = json['tags2'];
    verified = json['verified'];
    lat = json['lat'];
    long = json['long'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pic'] = this.pic;
    data['cover_photo'] = this.coverPhoto;
    data['name'] = this.name;
    data['delivery_time'] = this.deliveryTime;
    data['tags1'] = this.tags1;
    data['tags2'] = this.tags2;
    data['verified'] = this.verified;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
