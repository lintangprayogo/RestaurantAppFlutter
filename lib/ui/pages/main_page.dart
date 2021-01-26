part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initPage;
  MainPage({this.initPage: 0});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    selectedPage = widget.initPage;
    pageController = PageController(initialPage: 0);
  }

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
                Center(child: FoodPage()),
                Center(child: OrderHistoryPage()),
                Center(child: ProfilPage())
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
