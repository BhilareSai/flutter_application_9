class ItemData {
  String? sId;
  String? name;
  String? category;
  String? entryDate;
  String? expirationDate;
  String? location;
  String? status;

  ItemData(
      {this.sId,
      this.name,
      this.category,
      this.entryDate,
      this.expirationDate,
      this.location,
      this.status});

  ItemData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    category = json['category'];
    entryDate = json['entryDate'];
    expirationDate = json['expirationDate'];
    location = json['location'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['category'] = this.category;
    data['entryDate'] = this.entryDate;
    data['expirationDate'] = this.expirationDate;
    data['location'] = this.location;
    data['status'] = this.status;
    return data;
  }
}
