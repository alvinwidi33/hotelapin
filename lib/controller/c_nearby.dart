import 'package:get/get.dart';
import 'package:hotel_apin/source/hotel_source.dart';
import '../model/hotel.dart';

class CNearby extends GetxController {
  final _category = 'All Places'.obs;
  String get category => _category.value;
  set category(n) {
    _category.value = n;
    update();
  }

  List<String> get categories => [
        'All Places',
        'Industrial',
        'Village',
      ];

  final _listHotel = <Hotel>[].obs;
  List<Hotel> get listHotel => _listHotel.toList();

  final _searchText = ''.obs;
  String get searchText => _searchText.value;
  set searchText(String value) {
    _searchText.value = value;
    update();
  }

  getListHotel() async {
    _listHotel.value = await HotelSource.getHotel();
    update();
  }

  List<Hotel> get filteredHotels {
    if (searchText.isEmpty) {
      return listHotel;
    } else {
      return listHotel.where((hotel) {
        return hotel.name.toLowerCase().contains(searchText.toLowerCase()) ||
            hotel.location.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    }
  }

  @override
  void onInit() {
    getListHotel();
    super.onInit();
  }
}