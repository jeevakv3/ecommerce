import '../../allpackages.dart';

class AddCartController extends GetxController {
  var isLoad = false.obs;
  var qty = 1.obs;

  Future<void> addTheCartData(int productId, int quantity) async {
    final Map queryParamater = {'product_id': productId, 'quantity': productId};

    var data = await ApiService().postData('add_to_cart', queryParamater);
    if (data['message'] != null) {
      Get.snackbar(data['message'], '');
    }
  }

  void isLoadingBar(isLoad, type) {
    this.isLoad.value = isLoad;
    update([type]);
  }

  void qtyIncrement() {
    qty = qty + 1;
  }

  void decrease() {
    if (qty > 0) {
      qty = qty--;
    }
  }
}
