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
  getListHotel() async {
    _listHotel.value = await HotelSurce.getHotel();
    update();
  }

  @override
  void onInit() {
    getListHotel();
    super.onInit();
  }
}
