import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_apin/config/app_asset.dart';
import 'package:hotel_apin/config/app_color.dart';
import 'package:hotel_apin/config/app_format.dart';
import 'package:hotel_apin/model/booking.dart';

class DetailBookingPage extends StatelessWidget {
  DetailBookingPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    Booking booking = ModalRoute.of(context)!.settings.arguments as Booking;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text(
            'Detail Booking',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Header(booking, context),
            const SizedBox(height: 16),
            roomDetails(booking, context),
            const SizedBox(height: 16),
            paymentMethod(context),
            const SizedBox(height: 20),
          ],
        ));
  }

  Container paymentMethod(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset(AppAsset.iconMasterCard, width: 50),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Elliot York Owell',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text('Balance ${AppFormat.currency(80000)}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            )),
                      ],
                    ),
                  ),
                  const Icon(Icons.check_circle, color: AppColor.secondary),
                ],
              )),
        ],
      ),
    );
  }

  Container roomDetails(Booking booking, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Room Details',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          itemRoomDetail(context, 'Date',
              AppFormat.date(booking.date)),
          const SizedBox(height: 8),
          itemRoomDetail(context, 'Guest', '${booking.guest} Guest'),
          const SizedBox(height: 8),
          itemRoomDetail(context, 'Breakfast', booking.breakfast),
          const SizedBox(height: 8),
          itemRoomDetail(context, 'Check-In Time', booking.checkInTime),
          const SizedBox(height: 8),
          itemRoomDetail(context, '${booking.night} night', AppFormat.currency(12900)),
          const SizedBox(height: 8),
          itemRoomDetail(context, 'Service fee', AppFormat.currency(booking.serviceFee.toDouble()),),
          const SizedBox(height: 8),
          itemRoomDetail(context, 'Activites', AppFormat.currency(booking.activities.toDouble()),),
          const SizedBox(height: 8),
          itemRoomDetail(context, 'Total Payment', AppFormat.currency(booking.totelPayment.toDouble())),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Row itemRoomDetail(BuildContext context, String title, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          data,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Container Header(Booking booking, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              booking.cover,
              fit: BoxFit.cover,
              height: 70,
              width: 90,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booking.name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  booking.location,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}