import 'package:get/get.dart';
import 'package:hotel_apin/model/booking.dart';
import 'package:hotel_apin/source/booking_source.dart';

class CHistory extends GetxController {

  final _listBooking = <Booking>[].obs;
  List<Booking> get listBooking => _listBooking.toList();
  getListBooking(String id) async {
    _listBooking.value = await BookingSource.getHistory(id);
    update();
  }
}