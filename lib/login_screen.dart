import 'package:flutter/material.dart';
import 'reusable.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_Screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedGender = 'MALE';
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1960),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }



  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String gender in gendersList) {
      var newItem = DropdownMenuItem(
        child: Text(gender,style: TextStyle(color: Colors.black),),
        value: gender,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton(
      value: selectedGender,
      items: dropdownItems,
      onChanged: (value) {
        setState(
              () {
                selectedGender = value;
          },
        );
      },
    );
  }

  CupertinoPicker iosPicker(){

    List<Text> pickerItems = [];

    for (String gender in gendersList) {
      pickerItems.add(Text(gender,style: TextStyle(color: Colors.black),),);
    }

    return CupertinoPicker(
      backgroundColor: Colors.white,
      itemExtent: 29,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
              ),
              child: Image(
                image: AssetImage('image/ourlogo.png'),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Doctor App',
                        style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up As A Patient',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),

                  ReusableText(
                    texxt: 'Name',
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  ReusableTextField(),
                  SizedBox(
                    height: 8.0,
                  ),

                  ReusableText(
                    texxt: 'Phone Number',
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  ReusableTextField(),
                  SizedBox(
                    height: 8.0,
                  ),

                  ReusableText(
                    texxt: 'Date OF Birth',
                  ),
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () => _selectDate(context),
                      child: Text(currentDate.toString()),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),

                  ReusableText(
                    texxt: 'Gender',
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    height: 45.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 30.0),
                    color: Colors.white,
                    child: Platform.isAndroid ? androidDropdown() : iosPicker(),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),

                  ReusableText(
                    texxt: 'Password',
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  ReusablePasswordTextField(),
                  SizedBox(
                    height: 8.0,
                  ),
                  // ReusablePasswordTextField(),


                  ReusableText(
                    texxt: 'Confirm Password',
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  ReusablePasswordTextField(),
                  SizedBox(
                    height: 8.0,
                  ),
                  // ReusablePasswordTextField(),




                  SizedBox(
                    height: 4.0,
                  ),
                  ReusableButton(
                    buttontext: 'Register',
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
