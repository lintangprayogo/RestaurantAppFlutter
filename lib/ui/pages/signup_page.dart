part of 'pages.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();


  void showSnackBar(String msg) {
    Get.snackbar("", "",
        backgroundColor: "D9435E".toColor(),
        icon: Icon(
          MdiIcons.closeCircleOutline,
          color: Colors.white,
        ),
        titleText: Text(
          "Invalid Format",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        messageText: Text(
          msg,
          style: GoogleFonts.poppins(color: Colors.white),
        ));
  }
}

class _SingupPageState extends State<SingupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  User user;
  File picFile;

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      header: "Sign Up",
      subheader: "Register and enjoy food",
      backButtonFunction: () {
        Get.back();
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              PickedFile pickedFile =
                  await ImagePicker().getImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                picFile = File(pickedFile.path);
              }
              setState(() {});
            },
            child: Container(
              width: 110,
              height: 110,
              margin: EdgeInsets.only(top: 26),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/photo_border.png"))),
              child: (!picFile.isNull)
                  ? Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: FileImage(picFile), fit: BoxFit.cover)),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/photo.png"),
                              fit: BoxFit.cover)),
                    ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Full Name",
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
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your full name",
                ),
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
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
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your password",
                ),
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Confirm Password",
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
                obscureText: true,
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Retype your password",
                ),
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: RaisedButton(
              onPressed: () {
                if (emailController.text.isNullOrBlank |
                    passwordController.text.isNullOrBlank |
                    confirmPasswordController.text.isNullOrBlank |
                    nameController.text.isNullOrBlank |
                    picFile.isNullOrBlank) {
                  widget.showSnackBar(
                      "Please Input All The Fields And Photos !!!");
                  return;
                }

                if (!EmailValidator.validate(emailController.text)) {
                  widget.showSnackBar("Please Input Valid Email !!!");
                  return;
                }
                 if (confirmPasswordController.text.length<8) {
                  widget.showSnackBar("Please Input Password With Minimum 8 Characters");
                  return;
                }
                if (confirmPasswordController.text != passwordController.text) {
                  widget.showSnackBar("Password Doesn't Match !!!");
                  return;
                }
                Get.to(AddressPage(
                    User(
                      name: nameController.text,
                      email: emailController.text,
                    ),
                    passwordController.text,
                    picFile));
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: mainColor,
              child: Center(
                  child: Text(
                "Continue",
                style: whiteFontStyle1,
              )),
            ),
          )
        ],
      ),
    );
  }
}
