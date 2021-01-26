part of 'pages.dart';

class FoodDetailPage extends StatefulWidget {
  final Function backButtonFunction;
  final Transaction transaction;

  FoodDetailPage({this.backButtonFunction, this.transaction});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
              child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.transaction.food.imageUrl),
                        fit: BoxFit.cover),
                  ))),
          //Back Button
          SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      if (widget.backButtonFunction != null) {
                        widget.backButtonFunction();
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(3),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12,
                        ),
                        child: Image.asset("assets/back_arrow_white.png")),
                  ),
                ),
              ),
              //body
              Container(
                margin: EdgeInsets.only(top: 180),
                padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  134, //32+102
                              child: Text(
                                widget.transaction.food.name,
                                style: blackFontStyle2,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            FoodRating(widget.transaction.food.rate)
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity = max(1, quantity - 1);
                                });
                              },
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(width: 1),
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/btn_min.png'))),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Text(
                                quantity.toString(),
                                textAlign: TextAlign.center,
                                style: blackFontStyle2,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity = min(999, quantity + 1);
                                });
                              },
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(width: 1),
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/btn_add.png'))),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                      child: Text(
                        widget.transaction.food.description,
                        style: greyFontStyle,
                      ),
                    ),
                    Text(
                      "Ingredients:",
                      style: blackFontStyle3,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 4, 0, 41),
                      child: Text(widget.transaction.food.ingredients),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: greyFontStyle.copyWith(fontSize: 13),
                            ),
                            Text(
                              NumberFormat.currency(
                                      symbol: "IDR",
                                      decimalDigits: 0,
                                      locale: "id-ID")
                                  .format(widget.transaction.food.price*quantity),
                              style: blackFontStyle2.copyWith(fontSize: 18),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 163,
                          height: 45,
                          child: RaisedButton(
                            onPressed: () {
                              Get.to(PaymentPage(
                                  transaction: widget.transaction.copyWith(
                                      quantity: quantity,
                                      total: quantity *
                                          widget.transaction.food.price)));
                            },
                            color: "2ecc71".toColor(),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Order",
                              style: whiteFontStyle1,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ))
        ],
      )
    ]));
  }
}
