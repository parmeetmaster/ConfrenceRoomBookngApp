import 'package:kkconferences/model/room_images.dart';

import 'amenitie_model.dart';


class ConfressModel {
  String leadImage;
  int price;
  String address;
  String name;
  String roomNo;
  List<RoomImages> room_images;
  List<Amenitie> amenities;

  String description;

  ConfressModel({this.leadImage, this.price, this.address, this.name, this.roomNo,this.room_images,this.description,this.amenities});
}
