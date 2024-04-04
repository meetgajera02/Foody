// address_model.dart
class Address {
  String name;
  String phone;
  String area;
  String building;
  String city;
  String state;
  String pinCode;

  Address({
    required this.name, 
    required this.phone,
    required this.building,
    required this.city, 
    required this.state, 
    required this.pinCode,
    required this.area
  });
}
