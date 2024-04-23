import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({Key? key , required this.controller , required this.title , required this.hint}) : super(key: key);
 final TextEditingController controller;
  final String title;
  final  String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16 , vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          labelText: title,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black54
              )
          ),
          enabledBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.red
              )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green
            )
          )



        ),

      ),
    );
  }
}
