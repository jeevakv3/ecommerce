import '../../allpackages.dart';

class ProductReviewController extends GetxController {
  List<ProductReview> productReviewResponse = [];
  var isLoad = false.obs;

  Future<void> fetchProductViewCart(String endpoint) async {
    try {
      isLoadingBar(true, 'review');
      var response = await ApiService().getData(endpoint);
      productReviewResponse =
          response.map((e) => ProductReview.fromJson(e)).toList();
      isLoadingBar(false, 'review');
    } catch (e) {
      isLoadingBar(true, 'review');
      print(e.toString());
    }
  }

  Future<void> fetchProductViewComment(
      int productId, String comment, int rating) async {
    try {
      Map<String, dynamic> queryParamater = {
        'product_id': productId,
        'review_text': comment,
        'rating': 1
      };
      var response =
          await ApiService().postData('submit_review', queryParamater);
      if (response['message'] != null) {
        Get.snackbar(response['message'], '');
      }
      Get.back();
    } catch (e) {
      print(e.toString());
    }
  }

  void isLoadingBar(isLoad, type) {
    this.isLoad.value = isLoad;
    update([type]);
  }
}
