part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File picFile;
  AddressPage(this.user, this.password, this.picFile);
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();
  bool isLoading = false;
  List<String> cities;
  String selectedCity;

  @override
  void initState() {
    super.initState();
    cities = ['Bandung', 'Jakarta', 'Surabaya', 'Yogyakarta', 'Solo'];
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      header: "Address",
      subheader: "Fill up your address ",
      backButtonFunction: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Phone No.",
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
                controller: phoneController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your phone number",
                ),
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Address",
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
                controller: addressController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your address",
                ),
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "House No.",
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
                controller: houseNumController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Type your house number",
                ),
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "City",
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
              child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  items: cities
                      .map((e) => DropdownMenuItem(
                          child: Text(e, style: blackFontStyle3)))
                      .toList(),
                  onChanged: (item) {
                    selectedCity = item;
                  })),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: (isLoading)
                ? loadingIndicator
                : RaisedButton(
                    onPressed: () async {
                      User user = this.widget.user;
                      user.copyWith(
                          city: selectedCity,
                          houseNumber: houseNumController.text,
                          phoneNumber: phoneController.text);

                      setState(() {
                        isLoading = true;
                      });
                      await context
                          .read<UserCubit>()
                          .signUp(user, widget.password, widget.picFile);

                      UserState state = context.read<UserCubit>().state;
                      if (state is UserLoaded) {
                        context.read<FoodCubit>().getFoods();
                        context.read<TransactionCubit>().getTransactions();
                        Get.to(MainPage());
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            titleText: Text(
                              (state as UserFailed).msg,
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
                      "Sign Up Now",
                      style: whiteFontStyle1,
                    )),
                  ),
          )
        ],
      ),
    );
  }
}
