import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

defaultNavigateTo({context, screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

Widget defaultText({text, color, size, bool bold = false, textAlign = TextAlign.center })=> Text(
    text,
  textAlign: textAlign,
  style: TextStyle(
    color: HexColor(color),
    fontWeight: (bold == true) ? FontWeight.bold : FontWeight.normal,
    fontSize: size
  ),
);

void defaultFinishNavigate({context, screen}) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => screen), (route) => false);
}

Widget defaultTextFormField(
        {control,
        hint,
        suffixIcon,
          onChanged,
        prefixIcon,
        textInputType,
        valdiate,
        bool obscure = false}) =>
    Container(
      color: Colors.white,
      child: TextFormField(
        validator: valdiate,
        autofocus: false,
        controller: control,
        onChanged: onChanged,
        keyboardType: textInputType,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: HexColor('#23b2ff'),
            ),
          ),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: HexColor('#b0b3c7'),
              ),
            ),
            hintText: hint,
            hintStyle: TextStyle(color: HexColor('#b0b3c7')),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon),
        obscureText: obscure,
      ),
    );

defaultAppBar({leadingIcon,leadingFunction, actionIcon, actionFunction, bottom , bool leading = false, bool? action = false, title,
  bool blue = false
})=> AppBar(
    backgroundColor: (blue == true)? HexColor('#23b2ff') : Colors.white ,
    centerTitle: true,
    title: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: TextStyle(
            color: (blue == true)? Colors.white :Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
      ),
    ),
    leading: (leading == true ) ?Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        bottom: 4
      ),
      child: Container(
          height: 40,
          width: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: HexColor('#d3efff'),
              borderRadius: BorderRadius.circular(15.0)),
          child: IconButton(
            icon: Icon(
              leadingIcon,
              size: 16,
              color: HexColor('#23b2ff'),
            ),
            onPressed: leadingFunction
          )),
    ) : null,
    actions:  [
      Padding(
        padding: const EdgeInsets.only(top: 10, right: 10),
        child: (action == true ) ? Container(
            height: 40,
            width: 45,
            decoration: BoxDecoration(
                color: HexColor('#d3efff'),
                borderRadius: BorderRadius.circular(15.0)),
            child: IconButton(
              icon: Icon(
                actionIcon,
                color: HexColor('#23b2ff'),
              ),
              onPressed: actionFunction,
            )) : null,
      )
    ] ,
    elevation: 0.0,
  bottom: bottom,
);

Widget defaultTextFormFieldMobile(
        {control,
        hint,
        suffixIcon,
        prefixIcon,
        textInputType,
        valdiate,
        onChange,
        onChanged,
        bool obscure = false}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: HexColor('#b0b3c7')
          ),
          borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        children: [
          CountryCodePicker(
            onChanged: onChange,
            //(e) => print(e.dialCode),
            initialSelection: 'EG',
            showCountryOnly: false,
            hideMainText: false,
            showOnlyCountryWhenClosed: false,
            favorite: ['+02', 'EG'],
          ),
          Expanded(
            child: TextFormField(
              validator: valdiate,
              onChanged: onChanged,
              autofocus: false,
              autocorrect: false,
              controller: control,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon),
              obscureText: obscure,
            ),
          ),
        ],
      ),
    );

defaultAccessButton({text, function}) => MaterialButton(
      onPressed: function,
      child: Container(
        height: 40.0,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            color: HexColor('#23b2ff'),
            borderRadius: BorderRadius.circular(15.0)),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
Widget defaultAppBarIcons({icon, function}) => Padding(
  padding: const EdgeInsets.only(top: 10, right: 10),
  child: Container(
      height: 40,
      width: 45,
      decoration: BoxDecoration(
          color: HexColor('#d3efff'),
          borderRadius: BorderRadius.circular(15.0)),
      child: IconButton(
        icon: Icon(
          icon,
          color: HexColor('#23b2ff'),
        ),
        onPressed: function,
      )),
);
Widget defaultContainerScreen({height}) => Container(
      height: height * 0.4,
      decoration: BoxDecoration(
          color: HexColor('#23b2ff'),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(80.0),
              bottomLeft: Radius.circular(80.0))),
    );
