part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentUrl;

  PaymentMethodPage(this.paymentUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "Finish YourPayment",
        desc: "Please select a payment method\nsuitable for you",
        imgPath: "assets/wallet.png",
        buttonTitle1: "Payment Method",
        buttonTitle2: "Continue",
        onTap1: () async {
          launch(paymentUrl);
        },
        onTap2: () {
          Get.offAll(SuccessOrderPage());
        },
      ),
    );
  }
}
