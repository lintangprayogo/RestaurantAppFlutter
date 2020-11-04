part of 'widgets.dart';

class FoodItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 210,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(spreadRadius: 3, blurRadius: 5, color: Colors.black26)
          ]),
      child: Column(
        children: [
          FoodRating(3.5),
        ],
      ),
    );
  }
}
