import 'package:flutter/material.dart';
import 'package:kkconferences/global/const_funcitons.dart';
import 'package:kkconferences/model/booking_model.dart';
import 'package:kkconferences/providers/my_booking_provider.dart';
import 'package:kkconferences/widgets/active_booking_items.dart';
import 'package:provider/provider.dart';

class MyBookings extends StatefulWidget {
  static const classname = "/ActiveBookingItems";

  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bookings"),
      ),
      body: Consumer<MyBookingProvider>(builder: (context, value, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return getBookingWidget(value.mybookings[index]);
          },
          itemCount:value.mybookings.length
        );
      }),
    );
  }

  @override
  void initState() {
    final provider = Provider.of<MyBookingProvider>(context, listen: false);
    provider.loadMyBookings();

  }

  Widget getBookingWidget(BookingModel mybooking) {
    final provider=Provider.of<MyBookingProvider>(context,listen: false);

    return ActiveBookingItem(
      title: "Conference ${mybooking.roomno}",
      amount: mybooking.amount,
      start_duration: getDateWith12HrsFormat(mybooking.bookingStartTime),
      end_duration: getDateWith12HrsFormat(mybooking.bookingEndTime),
      date_of_booking: mybooking.bookingDate,
      oncancel: (){
        provider.performCancelBooking();
      },

    );
  }
}
