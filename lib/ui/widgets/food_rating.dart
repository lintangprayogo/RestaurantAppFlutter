part of 'widgets.dart';

class FoodRating extends StatelessWidget {
  final double rate;

  FoodRating(this.rate);

  @override
  Widget build(BuildContext context) {
    int numOfStar = rate.round();
    return Row(
      children: List<Widget>.generate(
              5,
              (index) => Icon(
                    (index < numOfStar) ? MdiIcons.star : MdiIcons.starOutline,
                    size: 16,
                    color: mainColor,
                  )) +
          [
            SizedBox(
              width: 4,
            ),
            Text(
              rate.toString(),
              style: greyFontStyle.copyWith(fontSize: 12),
            )
          ],
    );
  }
}
