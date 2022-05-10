import 'package:flutter/material.dart';
import 'package:homeclinic/modules/view/main_screen/profile_screen/payment_user_screen/add_new_payment/add_new_payment.dart';
import 'package:homeclinic/shared/components.dart';

class PaymentUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: defaultAppBar(
            leading: true,
            title: 'Payment Method',
            action: false,
            leadingIcon: Icons.arrow_back_ios_sharp,
          leadingFunction: (){
              Navigator.pop(context);
          }
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Center(
                child: Container(
                  height: height * 0.4,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.0784313725490196),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                        // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultText(text: 'You don’t have any payment method.Add now.', size: 16.0, color: '#747f9e', bold: true),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15, left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Image.asset('assets/image/payment4.png')
                  ),
                  Expanded(
                      child: defaultAccessButton(
                          text: 'Add New',
                          function: (){
                            defaultNavigateTo(context: context, screen: AddNewPayment());
                          }
                      )
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
