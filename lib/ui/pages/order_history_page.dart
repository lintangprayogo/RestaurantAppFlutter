part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transactionList.isEmpty) {
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
                          style: greyFontStyle.copyWith(
                              fontWeight: FontWeight.w300),
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
                        Builder(builder: (_) {
                          return Column(
                              children: (selectedIndex == 0
                                      ? mockTransactions
                                          .where((element) =>
                                              element.status ==
                                                  TransactionStatus
                                                      .on_delivery ||
                                              element.status ==
                                                  TransactionStatus.pending)
                                          .toList()
                                      : mockTransactions
                                          .where((element) =>
                                              element.status ==
                                                  TransactionStatus
                                                      .delivered||
                                              element.status ==
                                                  TransactionStatus.cancelled)
                                          .toList())
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: defaultMargin,
                                            left: defaultMargin,
                                            bottom: 16),
                                        child: OrderListItem(
                                            transaction: e,
                                            itemWidth: listItemWidth),
                                      ))
                                  .toList());
                        })
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
        }
      } else {
        return Center(child: loadingIndicator);
      }
    });
  }
}
