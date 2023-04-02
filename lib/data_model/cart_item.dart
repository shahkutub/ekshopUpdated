class CartItem {
  String id;
  String name;
  String price;
  String imageUrl;
  int quantity;


  CartItem({this.id, this.name, this.price, this.imageUrl,this.quantity});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
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
    imageUrl = map['imageUrl'];
    quantity = map['quantity'];

  }
}