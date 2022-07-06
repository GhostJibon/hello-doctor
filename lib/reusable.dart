import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 24),
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),

    );
  }
}




class ReusablePasswordTextField extends StatefulWidget {
  @override
  _ReusablePasswordTextFieldState createState() => _ReusablePasswordTextFieldState();
}

class _ReusablePasswordTextFieldState extends State<ReusablePasswordTextField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 24),
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.lightBlueAccent, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          suffixIcon: IconButton(
              icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              })),
    );
  }
}















class ReusableText extends StatelessWidget {

  ReusableText({this.texxt});
  String texxt;

  @override
  Widget build(BuildContext context) {
    return Text(texxt,
      style: TextStyle(color: Colors.black),
    );
  }
}


class ReusableButton extends StatelessWidget {

  ReusableButton({this.buttontext});
  String buttontext;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: () {
          //Implement registration functionality.
        },
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          buttontext,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


const List<String> gendersList = [
  'MALE',
  'FEMALE',
  'OTHER',
];