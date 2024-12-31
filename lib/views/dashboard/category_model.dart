class CategoryModel {
  dynamic status;
  dynamic meassage;
  List<CatogoryData>? catogoryData;

  CategoryModel({this.status, this.meassage, this.catogoryData});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    meassage = json['Meassage'];
    if (json['Catogory_data'] != null) {
      catogoryData = <CatogoryData>[];
      json['Catogory_data'].forEach((v) {
        catogoryData!.add(new CatogoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Meassage'] = this.meassage;
    if (this.catogoryData != null) {
      data['Catogory_data'] =
          this.catogoryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CatogoryData {
  dynamic id;
  dynamic name;
  dynamic image;
  dynamic urduName;
  dynamic createdAt;
  dynamic updatedAt;

  CatogoryData(
      {this.id,
        this.name,
        this.image,
        this.urduName,
        this.createdAt,
        this.updatedAt});

  CatogoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    urduName = json['urdu_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['urdu_name'] = this.urduName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}