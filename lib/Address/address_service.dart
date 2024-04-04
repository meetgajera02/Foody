// address_service.dart
import 'address_model.dart';

class AddressService {
  List<Address> addresses = [];

  void addAddress(Address address) {
    addresses.add(address);
  }

  List<Address> getAllAddresses() {
    return List.from(addresses);
  }

  void updateAddress(int index, Address updatedAddress) {
    addresses[index] = updatedAddress;
  }
}
