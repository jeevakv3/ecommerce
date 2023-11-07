import '../../allpackages.dart';

class ProductViewDetails extends StatefulWidget {
  ProductDetailsResponse data;
  ProductViewDetails(this.data);

  @override
  State<ProductViewDetails> createState() => _ProductViewDetailsState();
}

class _ProductViewDetailsState extends State<ProductViewDetails> {
  var controller = Get.put(AddCartController());
  PaymentService paymentService = PaymentService();

  @override
  void initState() {
    super.initState();
    paymentService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text('Product View'),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      child: Card(
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(widget.data.imageUrl!))),
                        ),
                      ),
                    ),
                    Text(
                      widget.data.name!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.data.description!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Price: ${widget.data.price.toString()}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Qty',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 45,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orangeAccent.shade100,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      controller.decrease();
                                    },
                                    icon: Icon(
                                      Icons.minimize_rounded,
                                      color: Colors.blue,
                                    )),
                                Obx(
                                  () => Text(
                                    controller.qty.value.toString(),
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      controller.qtyIncrement();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.blue,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ReviewProduct(widget.data.id!));
                      },
                      child: RichText(
                          text: TextSpan(
                        text: 'Click review >>>',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    controller.addTheCartData(
                        widget.data.id!.toInt(), controller.qty.value);
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent.shade100,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Add Card',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () {
                    paymentService.openRazorPayPayment(
                      num.parse(widget.data.price!),
                      widget.data.name!,
                    );
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Buy',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
