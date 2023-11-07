import '../../allpackages.dart';

class ViewCart extends StatefulWidget {
  const ViewCart({Key? key}) : super(key: key);

  @override
  State<ViewCart> createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  var controller = Get.put(ProductViewCartController());

  @override
  void initState() {
    super.initState();
    controller.fetchProductViewCart('view_cart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Cart'),
        backgroundColor: Colors.cyan,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GetBuilder<ProductViewCartController>(
          id: 'viewCart',
          builder: (_) {
            return controller.isLoad.value == true
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.productViewCartResponse.length,
                    itemBuilder: (context, index) {
                      var data = controller.productViewCartResponse[index];
                      return SizedBox(
                        height: 100,
                        child: Card(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            title: Text(data.name.toString()),
                            subtitle: Text(data.quantity.toString()),
                          ),
                        ),
                      );
                    });
          }),
    );
  }
}
