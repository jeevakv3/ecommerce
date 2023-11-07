import '../../allpackages.dart';

class ProductDetailsController extends GetxController {
  List<ProductDetailsResponse> productDetailsResponse =
      <ProductDetailsResponse>[].obs;
  var isLoad = false.obs;

  Future<void> fetchProductDetails(String endpoint) async {
    try {
      isLoadingBar(true, 'productList');
      var response = await ApiService().getData(endpoint);
      print(response);
      productDetailsResponse =
          response.map((e) => ProductDetailsResponse.fromJson(e)).toList();
      print(productDetailsResponse[0].description);
      isLoadingBar(false, 'productList');
    } catch (e) {
      isLoadingBar(true, 'productList');
      print(e.toString());
    }
  }

  void isLoadingBar(isLoad, type) {
    this.isLoad.value = isLoad;
    update([type]);
  }
}
