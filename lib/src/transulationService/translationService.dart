import '../../allpackages.dart';

class TrabslationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_Us': enUs, 'ta_In': taIN};

  Map<String, String> enUs = {
    "Product Details": "Product Details",
    "View Cart": "View Cart"
  };
  Map<String, String> taIN = {
    "Product Details": "தயாரிப்பு விவரங்கள்",
    "View Cart": "வண்டியைப் பார்க்கவும்",
  };
}
