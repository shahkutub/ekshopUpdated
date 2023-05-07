

class OrderSubmitProductModel {
    List<Product> product;

    OrderSubmitProductModel({this.product});

    factory OrderSubmitProductModel.fromJson(Map<String, dynamic> json) {
        return OrderSubmitProductModel(
            product: json['product'] != null ? (json['product'] as List).map((i) => Product.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.product != null) {
            data['product'] = this.product.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Product {
    String each_product_price;
    String id;
    String info;
    String total_price;
    String total_qty;

    Product({this.each_product_price, this.id, this.info, this.total_price, this.total_qty});

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            each_product_price: json['each_product_price'],
            id: json['id'],
            info: json['info'],
            total_price: json['total_price'],
            total_qty: json['total_qty'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['each_product_price'] = this.each_product_price;
        data['id'] = this.id;
        data['info'] = this.info;
        data['total_price'] = this.total_price;
        data['total_qty'] = this.total_qty;
        return data;
    }
}