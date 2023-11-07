import '../../allpackages.dart';

class PaymentService {
  Razorpay razorpay = Razorpay();

  void initialize() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar("Payment", "Payment Successfully ${response.paymentId} ");
  }

  handlePaymentError(PaymentFailureResponse response) {
    response.message;
    Get.snackbar("Payment", "Try Again  ${response.message}");
  }

  handleExternalWallet(ExternalWalletResponse response) {
    response.walletName;
    Get.snackbar("Payment", "Try Again  ${response.walletName}");
  }

  openRazorPayPayment(num amount, String name,
      [String? mobileNo, String? email]) {
    var options = {
      'key': 'rzp_test_gHFGa1vxkEI0E4',
      'amount': amount.toInt(),
      'name': name,
      'description': 'Payment to your Product',
      'prefill': {
        'contact': '9080613668',
        'email': 'jeevakv37@gmail.com',
      },
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }
}
