import 'package:flutter/material.dart';
import 'package:homeclinic/shared/components.dart';

class AddNewPayment extends StatelessWidget {
  var cardNumberController = TextEditingController();
  var cardNameController = TextEditingController();
  var cardSecurityCodeController = TextEditingController();
  var cardExpiryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
        title: 'Add New Card',
        action: false,
        leading: true,
        leadingIcon: Icons.arrow_back_ios_sharp,
        leadingFunction: (){
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.45098039215686275),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                      // changes position of shadow
                    ),
                  ],
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/image/card_payment.png'),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultText(text: 'Card Number', size: 14.0, bold: true, color: '#747f9e'),
                    SizedBox(height: 5.0,),
                    defaultTextFormField(
                        textInputType: TextInputType.number,
                      control: cardNumberController,
                      hint: '1234 5676 7897 5789',
                      valdiate: (String? value){
                          if(value!.isEmpty){
                            return 'Enter Your Card Number';
                          }
                      },
                    ),
                    SizedBox(height: 15,),
                    defaultText(text: 'Cardholder Name', size: 14.0, bold: true, color: '#747f9e'),
                    SizedBox(height: 5.0,),
                    defaultTextFormField(
                      textInputType: TextInputType.name,
                      control: cardNameController,
                      hint: 'Amr Nasser',
                      valdiate: (String? value){
                        if(value!.isEmpty){
                          return 'Enter Your Card Name';
                        }
                      },
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              defaultText(
                                text: 'Expiry',
                                color: '#747f9e',
                                size: 14.0,
                                bold: true,
                              ),
                              SizedBox(height: 5,),
                              defaultTextFormField(
                                  textInputType: TextInputType.number,
                                  hint: '06/24',
                                  control: cardExpiryController,
                                  valdiate: (String? value){
                                    if(value!.isEmpty){
                                      return 'Enter Your Card Expiry';
                                    }
                                  }
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              defaultText(
                                text: 'Security Code',
                                color: '#747f9e',
                                size: 14.0,
                                bold: true,
                              ),
                              SizedBox(height: 5,),
                              defaultTextFormField(
                                  textInputType: TextInputType.number,
                                  hint: '123',
                                  control: cardSecurityCodeController ,
                                  valdiate: (String? value){
                                    if(value!.isEmpty){
                                      return 'Enter Your Card Security Code';
                                    }
                                  }
                              ),
                            ],
                          ),
                        ),
                      ],
                    ) ,
                    SizedBox(height: 20,),
                    defaultAccessButton(
                      text: 'Save',
                      function: (){}
                    )
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
