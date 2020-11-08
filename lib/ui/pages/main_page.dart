part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
              child: Container(
            color: "FAFAFC".toColor(),
          )),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (idx) {
                setState(() {
                  selectedPage = idx;
                });
              },
              children: [
                Center(
                  child: FoodPage(),
                ),
                Center(
                    child: IllustrationPage(
                        title: "Ouch Hungry",
                        desc: "Seems you like have not\nordered any food yet'",
                        imgPath: "assets/empty.png",
                        buttonTitle1: "Let,s Order",
                        onTap1: () {})),
                Center(
                  child: Text("Profile"),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(
              selectedIndex: selectedPage,
              onSelected: (idx) {
                setState(() {
                  selectedPage = idx;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          )
        ],
      ),
    );
  }
}
