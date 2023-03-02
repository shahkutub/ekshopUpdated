class SliderV1 {
  String id;
  String merchantId;
  String name;
  String heading;
  String image;
  String status;
  String createdAt;
  String updatedAt;

  SliderV1({
    this.id,
    this.merchantId,
    this.name,
    this.heading,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  SliderV1.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    merchantId = json['merchant_id'];
    name = json['name'];
    heading = json['heading'];
    image = json['image'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
