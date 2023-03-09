// To parse this JSON data, do
//
//     final productDetailsResponse = productDetailsResponseFromJson(jsonString);
// https://app.quicktype.io/
import 'dart:convert';

ProductDetailsResponse productDetailsResponseFromJson(String str) => ProductDetailsResponse.fromJson(json.decode(str));

String productDetailsResponseToJson(ProductDetailsResponse data) => json.encode(data.toJson());

class ProductDetailsResponse {
    DataDetails data;
    bool success;

    ProductDetailsResponse({this.data, this.success});

    factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
        return ProductDetailsResponse(
            data: json['data'] != null ? DataDetails.fromJson(json['data']) : null,
            success: json['success'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['success'] = this.success;
        if (this.data != null) {
            data['`data`'] = this.data.toJson();
        }
        return data;
    }
}

class DataDetails {
    int v;
    String id;
    Brand brand;
    int calculable_price;
    List<Category> category;
    int cost_price;
    String createdAt;
    String description;
    int discount;
    String ean;
    bool has_discount;
    Object height;
    List<String> images;
    String isbn;
    String jan;
    Object length;
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
    Object points;
    int price;
    List<Object> product_attribute;
    List<Object> product_discount;
    List<Object> product_option_value;
    List<ProductReward> product_reward;
    List<Object> product_special;
    int quantity;
    List<Related> related;
    String sku;
    String status;
    String stock_status_id;
    String store_id;
    int subtract;
    List<Object> tag;
    String tax_class_id;
    String type;
    String upc;
    String updatedAt;
    String user;
    Object weight;
    String weight_class_id;
    Object width;

    DataDetails({this.v, this.id, this.brand, this.calculable_price, this.category, this.cost_price, this.createdAt, this.description, this.discount, this.ean, this.has_discount, this.height, this.images, this.isbn, this.jan, this.length, this.length_class_id, this.location, this.manufacturer, this.manufacturer_id, this.meta_description, this.meta_keyword, this.meta_title, this.minimum_qty, this.model, this.mpn, this.name, this.points, this.price, this.product_attribute, this.product_discount, this.product_option_value, this.product_reward, this.product_special, this.quantity, this.related, this.sku, this.status, this.stock_status_id, this.store_id, this.subtract, this.tag, this.tax_class_id, this.type, this.upc, this.updatedAt, this.user, this.weight, this.weight_class_id, this.width});

    factory DataDetails.fromJson(Map<String, dynamic> json) {
        return DataDetails(
            v: json['__v'],
            id: json['_id'],
            brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
            calculable_price: json['calculable_price'],
            category: json['category'] != null ? (json['category'] as List).map((i) => Category.fromJson(i)).toList() : null,
            cost_price: json['cost_price'],
            createdAt: json['createdAt'],
            description: json['description'],
            discount: json['discount'],
            ean: json['ean'],
            has_discount: json['has_discount'],
            //height: json['height'] != null ? Object.fromJson(json['height']) : null,
            images: json['images'] != null ? new List<String>.from(json['images']) : null,
            isbn: json['isbn'],
            jan: json['jan'],
            //length: json['length'] != null ? Object.fromJson(json['length']) : null,
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
            //points: json['points'] != null ? Object.fromJson(json['points']) : null,
            price: json['price'],
            // product_attribute: json['product_attribute'] != null ? (json['product_attribute'] as List).map((i) => Object.fromJson(i)).toList() : null,
            // product_discount: json['product_discount'] != null ? (json['product_discount'] as List).map((i) => Object.fromJson(i)).toList() : null,
            // product_option_value: json['product_option_value'] != null ? (json['product_option_value'] as List).map((i) => Object.fromJson(i)).toList() : null,
            // product_reward: json['product_reward'] != null ? (json['product_reward'] as List).map((i) => ProductReward.fromJson(i)).toList() : null,
            // product_special: json['product_special'] != null ? (json['product_special'] as List).map((i) => Object.fromJson(i)).toList() : null,
            quantity: json['quantity'],
            related: json['related'] != null ? (json['related'] as List).map((i) => Related.fromJson(i)).toList() : null,
            sku: json['sku'],
            status: json['status'],
            stock_status_id: json['stock_status_id'],
            store_id: json['store_id'],
            subtract: json['subtract'],
            //tag: json['tag'] != null ? (json['tag'] as List).map((i) => Object.fromJson(i)).toList() : null,
            tax_class_id: json['tax_class_id'],
            type: json['type'],
            upc: json['upc'],
            updatedAt: json['updatedAt'],
            user: json['user'],
            //weight: json['weight'] != null ? Object.fromJson(json['weight']) : null,
            weight_class_id: json['weight_class_id'],
           // width: json['width'] != null ? Object.fromJson(json['width']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['__v'] = this.v;
        data['_id'] = this.id;
        data['calculable_price'] = this.calculable_price;
        data['cost_price'] = this.cost_price;
        data['createdAt'] = this.createdAt;
        data['description'] = this.description;
        data['discount'] = this.discount;
        data['ean'] = this.ean;
        data['has_discount'] = this.has_discount;
        data['isbn'] = this.isbn;
        data['jan'] = this.jan;
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
        data['updatedAt'] = this.updatedAt;
        data['user'] = this.user;
        data['weight_class_id'] = this.weight_class_id;
        if (this.brand != null) {
            data['brand'] = this.brand.toJson();
        }
        if (this.category != null) {
            data['category'] = this.category.map((v) => v.toJson()).toList();
        }
        // if (this.height != null) {
        //     data['height'] = this.height.toJson();
        // }
        if (this.images != null) {
            data['images'] = this.images;
        }
        // if (this.length != null) {
        //     data['length'] = this.length.toJson();
        // }
        // if (this.points != null) {
        //     data['points'] = this.points.toJson();
        // }
        // if (this.product_attribute != null) {
        //     data['product_attribute'] = this.product_attribute.map((v) => v.toJson()).toList();
        // }
        // if (this.product_discount != null) {
        //     data['product_discount'] = this.product_discount.map((v) => v.toJson()).toList();
        // }
        // if (this.product_option_value != null) {
        //     data['product_option_value'] = this.product_option_value.map((v) => v.toJson()).toList();
        // }
        if (this.product_reward != null) {
            data['product_reward'] = this.product_reward.map((v) => v.toJson()).toList();
        }
        // if (this.product_special != null) {
        //     data['product_special'] = this.product_special.map((v) => v.toJson()).toList();
        // }
        // if (this.related != null) {
        //     data['related'] = this.related.map((v) => v.toJson()).toList();
        // }
        // if (this.tag != null) {
        //     data['tag'] = this.tag.map((v) => v.toJson()).toList();
        // }
        // if (this.weight != null) {
        //     data['weight'] = this.weight.toJson();
        // }
        // if (this.width != null) {
        //     data['width'] = this.width.toJson();
        // }
        return data;
    }
}

class Related {
    //String String;
    String name;

    Related({ this.name});

    factory Related.fromJson(Map<String, dynamic> json) {
        return Related(
           // String: json['String'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
       // data['String'] = this.String;
        data['name'] = this.name;
        return data;
    }
}

class Brand {
    int v;
    String id;
    String createdAt;
    String description;
    String merchant_id;
    String name;
    Object order;
    String permalink;
    String status;
    String updatedAt;
    String website;

    Brand({this.v, this.id, this.createdAt, this.description, this.merchant_id, this.name, this.order, this.permalink, this.status, this.updatedAt, this.website});

    factory Brand.fromJson(Map<String, dynamic> json) {
        return Brand(
            v: json['__v'],
            id: json['_id'],
            createdAt: json['createdAt'],
            description: json['description'],
            merchant_id: json['merchant_id'],
            name: json['name'],
            //order: json['order'] != null ? Object.fromJson(json['order']) : null,
            permalink: json['permalink'],
            status: json['status'],
            updatedAt: json['updatedAt'],
            website: json['website'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        // data['__v'] = this.__v;
        // data['_id'] = this._id;
        data['createdAt'] = this.createdAt;
        data['description'] = this.description;
        data['merchant_id'] = this.merchant_id;
        data['name'] = this.name;
        data['permalink'] = this.permalink;
        data['status'] = this.status;
        data['updatedAt'] = this.updatedAt;
        data['website'] = this.website;
        // if (this.order != null) {
        //     data['order'] = this.order.toJson();
        // }
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