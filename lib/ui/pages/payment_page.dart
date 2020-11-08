part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  final User user;
  final Transaction transaction;

  PaymentPage({this.user, this.transaction});
  @override
  Widget build(BuildContext context) {
    return BasicPage(
        header: "Payment",
        subheader: "You deserve amazing food",
        backButtonFunction: () {
          Get.back();
        },
        backColor: "FAFAFC".toColor(),
        child: Column(
          children: [
            //Top
            Container(
              margin: EdgeInsets.only(bottom: defaultMargin),
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item Ordered",
                    style: blackFontStyle3,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(transaction.food.imageUrl),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 198,

                                ///2 * defaultMargin+60+12+78
                                child: Text(
                                  transaction.food.name,
                                  style: blackFontStyle2,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Text(
                                NumberFormat.currency(locale: "id-ID")
                                    .format(transaction.food.price),
                                style: greyFontStyle.copyWith(fontSize: 13),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        "${transaction.quantity} item(s)",
                        style: greyFontStyle.copyWith(fontSize: 13),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      "Details Transaction",
                      style: blackFontStyle3,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 29,
                        child: Text(
                          transaction.food.name,
                          style: greyFontStyle,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 29,
                        child: Text(
                          NumberFormat.currency(
                                  locale: "id-ID",
                                  symbol: "IDR",
                                  decimalDigits: 0)
                              .format(transaction.food.price *
                                  transaction.quantity),
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 29,
                        child: Text(
                          "Driver",
                          style: greyFontStyle,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 29,
                        child: Text(
                          NumberFormat.currency(
                                  locale: "id-ID",
                                  symbol: "IDR",
                                  decimalDigits: 0)
                              .format(50000),
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 29,
                        child: Text(
                          "Tax 10%",
                          style: greyFontStyle,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 29,
                        child: Text(
                          NumberFormat.currency(
                                  locale: "id-ID",
                                  symbol: "IDR",
                                  decimalDigits: 0)
                              .format(transaction.food.price *
                                  transaction.quantity *
                                  0.1),
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 29,
                        child: Text(
                          "Total",
                          style: greyFontStyle,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 29,
                        child: Text(
                          NumberFormat.currency(
                                  locale: "id-ID",
                                  symbol: "IDR",
                                  decimalDigits: 0)
                              .format(transaction.food.price *
                                      transaction.quantity *
                                      1.1 +
                                  50000),
                          style: blackFontStyle3.copyWith(
                              fontWeight: FontWeight.w500,
                              color: "1ABC9C".toColor()),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            //Bottom
            Container(
              margin: EdgeInsets.only(bottom: defaultMargin),
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deliver to',
                    style: blackFontStyle3,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 80,
                          child: Text(
                            'Name',
                            style: greyFontStyle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              80,
                          child: Text(
                            transaction.user.name,
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phone Number',
                        style: greyFontStyle,
                      ),
                      Text(
                        transaction.user.phoneNumber,
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 80,
                          child: Text(
                            'Address',
                            style: greyFontStyle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              80,
                          child: Text(
                            transaction.user.address,
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'House Number',
                        style: greyFontStyle,
                      ),
                      Text(
                        transaction.user.houseNumber,
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'City',
                        style: greyFontStyle,
                      ),
                      Text(
                        transaction.user.city,
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                ],
              ),
            ),

            //// Checkout Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 45,
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                elevation: 0,
                color: "27ae60".toColor(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Checkout Now",
                  style: blackFontStyle3.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ));
  }
}
