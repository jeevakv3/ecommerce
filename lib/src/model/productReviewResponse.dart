class ProductReview {
  int? productId;
  String? reviewText;
  String? rating;
  String? name;

  ProductReview({this.productId, this.reviewText, this.rating, this.name});

  ProductReview.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    reviewText = json['review_text'];
    rating = json['rating'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['review_text'] = this.reviewText;
    data['rating'] = this.rating;
    data['name'] = this.name;
    return data;
  }
}
