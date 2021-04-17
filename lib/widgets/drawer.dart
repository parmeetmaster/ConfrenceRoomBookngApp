


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkconferences/api/FirbaseApi.dart';
import 'package:kkconferences/global/Global.dart';

class BookingScreenDrawer extends StatefulWidget {
  String username;
  String email;


  BookingScreenDrawer({this.username="?", this.email=""});

  @override
  _BookingScreenDrawerState createState() => _BookingScreenDrawerState();
}

class _BookingScreenDrawerState extends State<BookingScreenDrawer> {
  @override
  Widget build(BuildContext context) {
    return    ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(widget.username),
          accountEmail: Text(widget.email),
          currentAccountPicture: CircleAvatar(
            backgroundColor:
            Theme.of(context).platform == TargetPlatform.iOS
                ? Colors.blue
                : Colors.white,
            child: Text(
              widget.username.characters.first,
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          onTap: () async{
       QuerySnapshot shot=await  FireBaseApi().   getMyBookings(Global.activeCustomer);

       print("size of data is ${shot.docs.length}");
           for(QueryDocumentSnapshot item in shot.docs){
             print(item.data());
           }


       },

          title: Text("All Bookings"),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          title: Text("Cancel Bookings"),
          trailing: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
