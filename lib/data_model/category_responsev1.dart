class CategoryV1 {
  String id;
  String storeId;
  String merchantId;
  String name;
  String description;
  String metatag;
  String metadescription;
  String metakeyword;
  String parent;
  String parentIds;
  String parentNames;
  String image;
  bool top;
  String status;
  String createdAt;
  String updatedAt;

  CategoryV1({
    this.id,
    this.storeId,
    this.merchantId,
    this.name,
    this.description,
    this.metatag,
    this.metadescription,
    this.metakeyword,
    this.parent,
    this.parentIds,
    this.parentNames,
    this.image,
    this.top,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  CategoryV1.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    storeId = json['store_id'];
    merchantId = json['merchant_id'];
    name = json['name'];
    description = json['description'];
    metatag = json['metatag'];
    metadescription = json['metadescription'];
    metakeyword = json['metakeyword'];
    parent = json['parent'];
    parentIds = json['parent_ids'];
    parentNames = json['parent_names'];
    image = json['image'];
    top = json['top'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
