


import 'dart:convert';

AllProductResponse allProductResponseFromJson(String str) => AllProductResponse.fromJson(json.decode(str));

String allProductResponseToJson(AllProductResponse data) => json.encode(data.toJson());

class AllProductResponse {
    List<Data> data;
    String image;
    int totalCount;

    AllProductResponse({this.data, this.image, this.totalCount});

    factory AllProductResponse.fromJson(Map<String, dynamic> json) {
        return AllProductResponse(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null,
            image: json['image'],
            totalCount: json['totalCount'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['image'] = this.image;
        data['totalCount'] = this.totalCount;
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Data {
    int v;
    bool has_discount;
    dynamic discount;
    String id;
    String brand;
    List<Category> category;
    int cost_price;
    String description;
    String ean;
    String height;
    List<String> images;
    String isbn;
    String jan;
    String length;
    String length_class_id;
    String location;
    String manufacturer;
    String manufacturer_id;
    String meta_description;
    String meta_keyword;
    String meta_title;
    int minimum_qty;
    String model;
    String mpn;
    String name;
    String points;
    int price;
    List<Object> product_attribute;
    List<Object> product_discount;
    List<Object> product_option_value;
    List<ProductReward> product_reward;
    List<Object> product_special;
    int quantity;
    List<Object> related;
    String sku;
    String status;
    String stock_status_id;
    String store_id;
    int subtract;
    List<Object> tag;
    String tax_class_id;
    String type;
    String upc;
    String user;
    String weight;
    String weight_class_id;
    String width;

    Data({this.v, this.has_discount,this.id, this.brand, this.category, this.cost_price, this.description, this.ean, this.height, this.images, this.isbn, this.jan, this.length, this.length_class_id, this.location, this.manufacturer, this.manufacturer_id, this.meta_description, this.meta_keyword, this.meta_title, this.minimum_qty, this.model, this.mpn, this.name, this.points, this.price, this.product_attribute, this.product_discount, this.product_option_value, this.product_reward, this.product_special, this.quantity, this.related, this.sku, this.status, this.stock_status_id, this.store_id, this.subtract, this.tag, this.tax_class_id, this.type, this.upc, this.user, this.weight, this.weight_class_id, this.width});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            v: json['__v'],
            has_discount: json['has_discount'],
            id: json['_id'],
            brand: json['brand'],
            category: json['category'] != null ? (json['category'] as List).map((i) => Category.fromJson(i)).toList() : null,
            cost_price: json['cost_price'],
            description: json['description'],
            ean: json['ean'],
            height: json['height'],
            images: json['images'] != null ? new List<String>.from(json['images']) : null,
            isbn: json['isbn'],
            jan: json['jan'],
            length: json['length'],
            length_class_id: json['length_class_id'],
            location: json['location'],
            manufacturer: json['manufacturer'],
            manufacturer_id: json['manufacturer_id'],
            meta_description: json['meta_description'],
            meta_keyword: json['meta_keyword'],
            meta_title: json['meta_title'],
            minimum_qty: json['minimum_qty'],
            model: json['model'],
            mpn: json['mpn'],
            name: json['name'],
            points: json['points'],
            price: json['price'],

            product_reward: json['product_reward'] != null ? (json['product_reward'] as List).map((i) => ProductReward.fromJson(i)).toList() : null,
            quantity: json['quantity'],

            sku: json['sku'],
            status: json['status'],
            //stock_status_id: json['stock_status_id'],
            store_id: json['store_id'],
            subtract: json['subtract'],
            tax_class_id: json['tax_class_id'],
            type: json['type'],
            upc: json['upc'],
            user: json['user'],
            weight: json['weight'],
            weight_class_id: json['weight_class_id'],
            width: json['width'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['__v'] = this.v;
        data['has_discount'] = this.has_discount;
        data['_id'] = this.id;
        data['brand'] = this.brand;
        data['cost_price'] = this.cost_price;
        data['description'] = this.description;
        data['ean'] = this.ean;
        data['height'] = this.height;
        data['isbn'] = this.isbn;
        data['jan'] = this.jan;
        data['length'] = this.length;
        data['length_class_id'] = this.length_class_id;
        data['location'] = this.location;
        data['manufacturer'] = this.manufacturer;
        data['manufacturer_id'] = this.manufacturer_id;
        data['meta_description'] = this.meta_description;
        data['meta_keyword'] = this.meta_keyword;
        data['meta_title'] = this.meta_title;
        data['minimum_qty'] = this.minimum_qty;
        data['model'] = this.model;
        data['mpn'] = this.mpn;
        data['name'] = this.name;
        data['points'] = this.points;
        data['price'] = this.price;
        data['quantity'] = this.quantity;
        data['sku'] = this.sku;
        data['status'] = this.status;
        data['stock_status_id'] = this.stock_status_id;
        data['store_id'] = this.store_id;
        data['subtract'] = this.subtract;
        data['tax_class_id'] = this.tax_class_id;
        data['type'] = this.type;
        data['upc'] = this.upc;
        data['user'] = this.user;
        data['weight'] = this.weight;
        data['weight_class_id'] = this.weight_class_id;
        data['width'] = this.width;
        if (this.category != null) {
            data['category'] = this.category.map((v) => v.toJson()).toList();
        }
        if (this.images != null) {
            data['images'] = this.images;
        }

        return data;
    }
}

class ProductReward {
    String id;
    String points;

    ProductReward({this.id, this.points});

    factory ProductReward.fromJson(Map<String, dynamic> json) {
        return ProductReward(
            id: json['id'],
            points: json['points'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['points'] = this.points;
        return data;
    }
}

class Category {
    String id;
    String name;

    Category({this.id, this.name});

    factory Category.fromJson(Map<String, dynamic> json) {
        return Category(
            id: json['id'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}