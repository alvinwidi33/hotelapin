import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_apin/config/app_color.dart';
import 'package:hotel_apin/controller/c_home.dart';
import 'package:hotel_apin/page/coming_soon_page.dart';
import 'package:hotel_apin/page/history_page.dart';
import 'package:hotel_apin/page/nearby_page.dart';
import '../config/app_asset.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final cHome = Get.put(CHome());
  final List<Map> listNav = [
    {'icon': AppAsset.iconNearby, 'label': 'Nearby'},
    {'icon': AppAsset.iconHistory, 'label': 'History'},
    {'icon': AppAsset.iconPayment, 'label': 'Payment'},
    {'icon': AppAsset.iconReward, 'label': 'Reward'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (cHome.indexPage == 0) {
          return NearbyPage();
        } else if (cHome.indexPage == 1) {
          return HistoryPage();
        }
        return ComingSoonPage();
      }),
      bottomNavigationBar: Obx(() {
        return Material(
          elevation: 8,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 8, bottom: 6),
            child: BottomNavigationBar(
              currentIndex: cHome.indexPage,
              onTap: (value) => cHome.indexPage = value,
              elevation: 0,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
              selectedIconTheme: const IconThemeData(
                color: AppColor.primary,
              ),
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              selectedFontSize: 12,
              items: listNav.map((e) {
                return BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(e['icon'])),
                  label: e['label'],
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
