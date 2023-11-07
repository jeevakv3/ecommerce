class ProductDetailsResponse {
  int? id;
  String? name;
  String? description;
  String? price;
  String? imageUrl;

  ProductDetailsResponse(
      {this.id, this.name, this.description, this.price, this.imageUrl});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
