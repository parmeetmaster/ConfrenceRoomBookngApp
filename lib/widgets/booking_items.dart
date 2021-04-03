import 'package:flutter/material.dart';

class BookingItem extends StatelessWidget {
   String startTime;
   String endTime;
   String dateStr;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        shadowColor: Colors.black,
        elevation:9,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [Icon(Icons.watch_later_outlined,color: Colors.green,),Text(" Start Time: 9:00 AM",overflow: TextOverflow.ellipsis,),
                  Spacer(),
                    Icon(Icons.watch_later_outlined,color: Colors.red,),Text(" End Time: 9:00 AM",overflow: TextOverflow.ellipsis,)
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [Icon(Icons.calendar_today_sharp,color: Colors.black54,),SizedBox(width: 5),Text("Date: 03-27-2020"),
                    Spacer(),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
