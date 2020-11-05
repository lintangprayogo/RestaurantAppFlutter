part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    style: greyFontStyle.copyWith(fontWeight: FontWeight.w300),
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
                            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60"),
                        fit: BoxFit.cover)),
              )
            ],
          ),
        ),
        Container(
          height: 258,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: mockfoods
                    .map((e) => Padding(
                          padding: EdgeInsets.only(
                              left: (e == mockfoods.first) ? defaultMargin : 0,
                              right: defaultMargin),
                          child: FoodItem(e),
                        ))
                    .toList(),
              )
            ],
          ),
        ) //Middle
      ],
    );
  }
}
