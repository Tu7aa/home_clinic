import 'package:flutter/material.dart';
import 'package:homeclinic/shared/components.dart';

class SearchDoctorScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        child: Column(
          children: [
            defaultTextFormField(
              hint: 'input Doctor\'s Name',
              suffixIcon: Icon(Icons.search),
              control: searchController,

            )
          ],
        ),
      ),
    );
  }
}
