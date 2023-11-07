class ProductViewCartResponse {
  int? productId;
  String? quantity;
  String? name;

  ProductViewCartResponse({this.productId, this.quantity, this.name});

  ProductViewCartResponse.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['name'] = this.name;
    return data;
  }
}
