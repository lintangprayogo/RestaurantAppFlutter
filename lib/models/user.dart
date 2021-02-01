part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;
  static String token;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});
      
  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        address: data['address'],
        houseNumber: data['houseNumber'],
        phoneNumber: data['phoneNumber'],
        city: data['city'],
        picturePath: data['profile_photo_url'],
      );

  User copyWith({
    int id,
    String name,
    String email,
    String address,
    String houseNumber,
    String phoneNumber,
    String city,
    String picturePath,
  }) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        houseNumber: houseNumber ?? this.houseNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        city: city ?? this.city,
        picturePath: city ?? this.picturePath);
  }

  @override
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = User(
    id: 1,
    name: 'Hayama Luthor',
    address: 'Jalan Jenderal Sudirman',
    city: 'Bandung',
    houseNumber: '1234',
    phoneNumber: '08123456789',
    email: 'hayama.luthor@luthor.com',
    picturePath:
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60');
