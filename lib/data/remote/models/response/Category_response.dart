class CategoryResponse {
  CategoryResponse({
      this.createAt, 
      this.createBy, 
      this.updateAt, 
      this.updateBy, 
      this.id, 
      this.name, 
      this.imageUrl, 
      this.status,});

  CategoryResponse.fromJson(dynamic json) {
    createAt = json['createAt'];
    createBy = json['createBy'];
    updateAt = json['updateAt'];
    updateBy = json['updateBy'];
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    status = json['status'];
  }
  String? createAt;
  String? createBy;
  dynamic updateAt;
  dynamic updateBy;
  int? id;
  String? name;
  dynamic imageUrl;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createAt'] = createAt;
    map['createBy'] = createBy;
    map['updateAt'] = updateAt;
    map['updateBy'] = updateBy;
    map['id'] = id;
    map['name'] = name;
    map['imageUrl'] = imageUrl;
    map['status'] = status;
    return map;
  }

}