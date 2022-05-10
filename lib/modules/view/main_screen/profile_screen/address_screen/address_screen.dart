import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/shared/components.dart';
import 'package:homeclinic/shared/local/shared.dart';

class AddressScreen extends StatefulWidget {
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  String? Address = 'Search';
  String location ='Null, Press Button';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    Address = '${place.locality}, ${place.country}';
    print(Address);
    setState(()  {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
        title: 'Address',
        action: false,
        leading: true,
        leadingIcon: Icons.arrow_back_ios_sharp,
        leadingFunction: (){
          Navigator.pop(context);
        }
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined,color: HexColor('#23b2ff'),),
                  SizedBox(width: 15,),
                  defaultText(
                    color: '#747f9e',
                    size: 14.0,
                    bold: true,
                    text: '$Address'
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            defaultAccessButton(
              text: (Address == 'Search') ? 'New Address' : 'Add Another Address',
              function: ()async{
                  Position position = await _getGeoLocationPosition();
                  location ='Lat: ${position.latitude} , Long: ${position.longitude}';
                  GetAddressFromLatLong(position);
                },

            )
          ],
        ),
      )
    );
  }
}
