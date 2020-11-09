part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  List<Transaction> inProgress = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.on_delivery ||
          element.status == TransactionStatus.pending)
      .toList();

  List<Transaction> past = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.cancelled ||
          element.status == TransactionStatus.delivered)
      .toList();
  @override
  Widget build(BuildContext context) {
    if (past.length == 0 && inProgress.length == 0) {
      return IllustrationPage(
        title: "Ouch Hungry",
        desc: "Seems you like have not\nordered any food yet'",
        imgPath: "assets/empty.png",
        buttonTitle1: "Let,s Order",
        onTap1: () {},
      );
    } else {
      double listItemWidth =
          MediaQuery.of(context).size.width - 2 * defaultMargin;

      return ListView(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Orders",
                      style: blackFontStyle1,
                    ),
                    Text(
                      'Wait for the best meal',
                      style:
                          greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    CustomTabBar(
                      titles: ["In Progress", "Past Orders"],
                      selectedIndex: selectedIndex,
                      onSelected: (idx) {
                        setState(() {
                          selectedIndex = idx;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                        children: (selectedIndex == 0 ? inProgress : past)
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(
                                      right: defaultMargin,
                                      left: defaultMargin,
                                      bottom: 16),
                                  child: OrderListItem(
                                      transaction: e, itemWidth: listItemWidth),
                                ))
                            .toList())
                  ],
                ),
              )
            ],
          ),
        ],
      );
    }
  }
}
