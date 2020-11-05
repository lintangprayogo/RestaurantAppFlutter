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

List<Food> mockfoods = [
  Food(
      id: 1,
      imageUrl:
          "https://i.pinimg.com/originals/6a/98/d7/6a98d79acdb7dd3368c69d9649cf5279.jpg",
      name: "Sate Sayur Sultan",
      description: "Sate taichan terenak dari bandung",
      ingredients:
          "Ayam,Cabe rawit,Cabe merah keriting, Bawang merah,Bawang putih",
      price: 150000,
      rate: 4.2),
  Food(
      id: 2,
      imageUrl:
          "https://img-global.cpcdn.com/recipes/fd2b01f976451b6a/751x532cq70/tumis-kentang-kornet-foto-resep-utama.jpg",
      name: "Tumis Kentang Kornet",
      description: "Perpaduan kentang dan kornet enak dan nikmat",
      ingredients: "Kentang ,Kornet,Bawang Bombai ,Bawang Putih",
      price: 50000,
      rate: 3),
  Food(
      id: 3,
      imageUrl:
          "https://i1.wp.com/varminz.com/wp-content/uploads/2019/12/mexican-chopped-salad3.jpg?fit=843%2C843&ssl=1",
      name: "Mexican Chopped Salad",
      description:
          "Salad ala mexico yang kaya akan serat dan vitamin. Seluruh bahan diambil dari Mexico sehingga akan memiliki cita rasa yang original.",
      ingredients: "Jagung, Selada, Tomat Ceri, Keju, Wortel",
      price: 105900,
      rate: 3.9),
  Food(
      id: 4,
      imageUrl:
          "https://cdn.pixabay.com/photo/2014/10/09/20/02/tomato-soup-482403_960_720.jpg",
      name: "Sup Tomat Pedas",
      description:
          "Sup tomat pedas yang unik ini cocok banget buat kalian-kalian yang suka pedas namun ingin tetap sehat. Rasanya yang unik akan memanjakan lidah Anda.",
      ingredients: "Tomat, Seledri, Kacang Tanah, Labu, Garam, Gula",
      price: 60000,
      rate: 4.9),
  Food(
      id: 5,
      imageUrl:
          "https://cmxpv89733.i.lithium.com/t5/image/serverpage/image-id/478345i84598AB4FEB454CB/image-size/large?v=1.0&px=999",
      name: "Korean Raw Beef Tartare",
      description:
          "Daging sapi Korea cincang yang disajikan mentah dan disiram saus spesial dengan toping kuning telur dan taburan biji wijen.",
      ingredients: "Daging Sapi Korea, Telur, Biji Wijen",
      price: 350000,
      rate: 3.4)
];
