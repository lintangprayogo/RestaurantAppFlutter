part of 'models.dart';

class Food {
  final int id;
  final String imageUrl;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;

  Food(
      {this.id,
      this.imageUrl,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate});
}

Food mockFood = Food(
    id: 1,
    imageUrl:
        "https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg",
    name: "Sate Sayur Sultan",
    description:
        "Sate Sayur Sultan adalah menu sate vegan paling terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan bermutu tinggi. Semua bahan ditanam dengan menggunakan teknologi masa kini sehingga memiliki nutrisi yang kaya.",
    ingredients: "Bawang Merah, Paprika, Bawang Bombay, Timun",
    price: 150000,
    rate: 4.2);
