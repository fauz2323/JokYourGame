import 'package:flutter/material.dart';

class FormWidgetNormal extends StatelessWidget {
  final String tittle;
  const FormWidgetNormal({Key? key, required this.tittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: tittle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.all(5),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
