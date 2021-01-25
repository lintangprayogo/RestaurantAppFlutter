part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BasicPage(
      header: "Login",
      subheader: "Find The Amazing Food",
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Email",
              style: blackFontStyle2,
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your email address",
                ),
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Password",
              style: blackFontStyle2,
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your password",
                ),
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: isLoading
                ? loadingIndicator
                : RaisedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await context.read<UserCubit>().signIn(
                          emailController.text, passwordController.text);
                      UserState state = context.read<UserCubit>().state;
                      if (state is UserLoaded) {
                        context.read<FoodCubit>();
                        context.read<TransactionCubit>();
                        Get.to(MainPage());
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            titleText: Text(
                              "Login Failed",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            messageText: Text(
                              (state as UserFailed).msg,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ));
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: mainColor,
                    child: Center(
                        child: Text(
                      "Login",
                      style: whiteFontStyle1,
                    )),
                  ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: isLoading
                ? loadingIndicator
                : RaisedButton(
                    onPressed: () {
                      Get.to(SingupPage());
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: greyColor,
                    child: Center(
                        child: Text(
                      "Create New Account",
                      style: whiteFontStyle1,
                    )),
                  ),
          )
        ],
      ),
    );
  }
}
