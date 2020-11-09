part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IllustrationPage(
          title: "Yeay! Completed",
          desc: "Now you are able to order\nsome foods as a self reward",
          imgPath: 'assets/food_wishes.png',
          onTap1: () {},
          buttonTitle1: 'Find Foods',
        ));
  }
}
