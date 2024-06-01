import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/hotel.dart';

class HotelSurce {
  static Future<List<Hotel>> getHotel() async {
    var result = await FirebaseFirestore.instance.collection('Hotel').get();
    return result.docs.map((e) => Hotel.fromJson(e.data())).toList();
  }
}
