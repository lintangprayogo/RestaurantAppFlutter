part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String desc;
  final String imgPath;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function onTap1;
  final Function onTap2;

  IllustrationPage(
      {@required this.title,
      @required this.desc,
      @required this.imgPath,
      @required this.buttonTitle1,
      this.buttonTitle2,
      @required this.onTap1,
      this.onTap2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.fill)),
          ),
          Text(
            title,
            style: blackFontStyle3.copyWith(fontSize: 20),
          ),
          Text(
            desc,
            style: greyFontStyle.copyWith(fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 12),
            width: 200,
            height: 45,
            child: RaisedButton(
                onPressed: onTap1,
                color: mainColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  buttonTitle1,
                  style: blackFontStyle3.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.white),
                )),
          ),
          (onTap2 != null)
              ? Container(
                  width: 200,
                  height: 45,
                  child: RaisedButton(
                      onPressed: onTap2,
                      color: "8D92A3".toColor(),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        buttonTitle2,
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500),
                      )),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
