class CartItem {
  String id;
  String name;
  String price;
  int quantity;

  CartItem({this.id, this.name, this.price, this.quantity});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'price': price,
      'quantity': quantity,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  CartItem.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    price = map['price'];
    quantity = map['quantity'];
  }
}