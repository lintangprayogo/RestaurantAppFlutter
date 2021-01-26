part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "You've Made Order",
        desc:
            "Just enjoying yourself at home while\nwe are preparing your  greatest meal",
        imgPath: "assets/bike.png",
        buttonTitle1: "Order Another Foods",
        buttonTitle2: "View My Orders",
        onTap1: () {
          Get.offAll(MainPage());
        },
        onTap2: () {
          Get.offAll(MainPage(initPage:1));
        },
      ),
    );
  }
}
