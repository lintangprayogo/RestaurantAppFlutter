part of 'pages.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          height: 220,
          margin: EdgeInsets.only(bottom: defaultMargin),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    margin: EdgeInsets.only(top: 26),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/photo_border.png"))),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage((context.bloc<UserCubit>().state as UserLoaded).user.picturePath),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Text((context.bloc<UserCubit>().state as UserLoaded).user.name,
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.black)),
                  Text((context.bloc<UserCubit>().state as UserLoaded).user.email,
                      style:
                          greyFontStyle.copyWith(fontWeight: FontWeight.w300)),
                ],
              )
            ],
          ),
        ),
        //// Body
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomTabBar(
                titles: ["Account", "FoodMarket"],
                selectedIndex: selectedIndex,
                onSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                children: ((selectedIndex == 0)
                        ? [
                            'Edit Profile',
                            'Home Address',
                            'Security',
                            'Payment'
                          ]
                        : [
                            'Rate App',
                            'Help Center',
                            'Privacy & Policy',
                            'Term & Condition'
                          ])
                    .map((e) => Padding(
                          padding: EdgeInsets.only(
                              bottom: 16,
                              left: defaultMargin,
                              right: defaultMargin),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e,
                                style: blackFontStyle3,
                              ),
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset(
                                  'assets/right_arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              )
                            ],
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
        SizedBox(
          height: 80,
        )
      ],
    );
  }
}
