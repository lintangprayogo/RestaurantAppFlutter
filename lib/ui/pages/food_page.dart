part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            //top
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Resto App",
                        style: blackFontStyle1,
                      ),
                      Text(
                        "Let's get greatest meal ever",
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                (context.read<UserCubit>().state as UserLoaded)
                                    .user
                                    .picturePath),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
            //middle
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) => (state is FoodLoaded)
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: state.foodList
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                          left: (e == mockFoods.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin),
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.to(FoodDetailPage(
                                              transaction: Transaction(
                                                  food: e,
                                                  user: (context
                                                          .read<UserCubit>()
                                                          .state as UserLoaded)
                                                      .user),
                                              backButtonFunction: () {
                                                Get.back();
                                              },
                                            ));
                                          },
                                          child: FoodItem(e)),
                                    ))
                                .toList(),
                          )
                        ],
                      )
                    : Center(child: loadingIndicator),
              ),
            ),
            //bottom
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    selectedIndex: selectedIndex,
                    titles: ["New Food", "Popular", "Recommend"],
                    onSelected: (idx) {
                      setState(() {
                        selectedIndex = idx;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                    if (state is FoodLoaded) {
                      List<Food> body = state.foodList
                          .where((element) =>
                              element.types.contains((selectedIndex == 0)
                                  ? FoodType.new_food
                                  : (selectedIndex == 1)
                                      ? FoodType.popular
                                      : FoodType.recommended))
                          .toList();
                      return Column(
                        children: body
                            .map((e) => Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      defaultMargin, 0, defaultMargin, 16),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(FoodDetailPage(
                                        transaction: Transaction(
                                            food: e,
                                            user: (context
                                                    .read<UserCubit>()
                                                    .state as UserLoaded)
                                                .user),
                                        backButtonFunction: () {
                                          Get.back();
                                        },
                                      ));
                                    },
                                    child: FoodItemSmall(
                                      food: e,
                                      itemWidth: listItemWidth,
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(child: loadingIndicator);
                    }
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ],
    );
  }
}
