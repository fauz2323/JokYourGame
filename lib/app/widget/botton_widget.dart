import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottonClassNormal extends StatelessWidget {
  final String tittle;
  final VoidCallback func;
  const BottonClassNormal({Key? key, required this.tittle, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 70 / 100,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: func,
        child: Text(tittle),
      ),
    );
  }
}
