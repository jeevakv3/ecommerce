import '../../allpackages.dart';

class ReviewProduct extends StatefulWidget {
  int productId;
  ReviewProduct(this.productId);

  @override
  State<ReviewProduct> createState() => _ReviewProductState();
}

class _ReviewProductState extends State<ReviewProduct> {
  var controller = Get.put(ProductReviewController());

  TextEditingController submitController = TextEditingController();

  int rating = 0;

  @override
  void initState() {
    super.initState();
    controller.fetchProductViewCart('get_reviews/${widget.productId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text('Product Review'),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: GetBuilder<ProductReviewController>(
        id: 'review',
        builder: (_) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                controller.isLoad.value == true
                    ? const Center(child: CircularProgressIndicator())
                    : controller.productReviewResponse.isEmpty
                        ? Expanded(
                            child: const Center(
                                child: Text(
                              'No review found',
                              style: TextStyle(color: Colors.black),
                            )),
                          )
                        : Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    controller.productReviewResponse.length,
                                itemBuilder: (context, index) {
                                  var data =
                                      controller.productReviewResponse[index];
                                  return SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ListTile(
                                        title: Text(data.name!),
                                        subtitle: Text(data.rating!),
                                        trailing: Text(data.reviewText!),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                const SizedBox(
                  height: 55,
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      this.rating = rating.toInt();
                    });
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          controller: submitController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(8.0),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    controller.fetchProductViewComment(
                                        widget.productId,
                                        submitController.text,
                                        rating);
                                    submitController.clear();
                                  },
                                  child: Icon(Icons.send_outlined)),
                              labelText: '  Enter review'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
