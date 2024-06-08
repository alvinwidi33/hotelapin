import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_apin/controller/c_home.dart';
import 'package:hotel_apin/page/home_page.dart';
import 'package:hotel_apin/widget/button_custom.dart';
import '../model/hotel.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cHome = Get.put(CHome());
    Hotel hotel = ModalRoute.of(context)!.settings.arguments as Hotel;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 6, color: Colors.white),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                hotel.cover,
                fit: BoxFit.cover,
                height: 170,
                width: 190,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Payment Success',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,
            'Enjoy yor a whole new experience\nin this beautiful world',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                ),
          ),
          const SizedBox(height: 32),
          ButtonCustom(
            label: 'View My Booking',
            onTap: () {
              cHome.indexPage = 1;
              Get.offAll(() => HomePage());
            },
          ),
        ],
      ),
    );
  }
}
