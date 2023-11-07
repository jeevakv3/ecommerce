import '../../allpackages.dart';

class ProductViewCartController extends GetxController {
  List<ProductViewCartResponse> productViewCartResponse =
      <ProductViewCartResponse>[].obs;
  var isLoad = false.obs;

  Future<void> fetchProductViewCart(String endpoint) async {
    try {
      isLoadingBar(true, 'viewCart');
      var response = await ApiService().getData(endpoint);
      print(response);
      productViewCartResponse =
          response.map((e) => ProductViewCartResponse.fromJson(e)).toList();
      isLoadingBar(false, 'viewCart');
    } catch (e) {
      isLoadingBar(true, 'viewCart');
      print(e.toString());
    }
  }

  void isLoadingBar(isLoad, type) {
    this.isLoad.value = isLoad;
    update([type]);
  }
}
