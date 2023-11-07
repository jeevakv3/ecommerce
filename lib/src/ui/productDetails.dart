import '../../allpackages.dart';
import 'viewCart.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var controller = Get.put(ProductDetailsController());

  @override
  void initState() {
    controller.fetchProductDetails('products');
  }

  bool isSwitched = false;

  toogleLanguage() {
    final currentLocal = Get.locale;
    if (currentLocal!.languageCode == 'en') {
      Get.updateLocale(Locale('ta', 'IN'));
    } else {
      Get.updateLocale(Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Switch(
          value: isSwitched,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              toogleLanguage();
              isSwitched = value;
            });
          },
        ),
        title: Text('Product Details'.tr),
        backgroundColor: Colors.cyan,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetBuilder<ProductDetailsController>(
              id: 'productList',
              builder: (_) {
                return controller.isLoad.value == true
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: GridView.builder(
                          itemCount: controller.productDetailsResponse.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                            childAspectRatio: 1.0,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            var data = controller.productDetailsResponse[index];
                            return InkWell(
                              onTap: () {
                                Get.to(ProductViewDetails(data));
                              },
                              child: SizedBox(
                                height: 500,
                                child: Card(
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      data.imageUrl!))),
                                        ),
                                        Text(
                                          data.name!,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          data.description!,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Price: ${data.price.toString()}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
              }),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () {
                Get.to(ViewCart());
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent.shade100,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'View Cart'.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
