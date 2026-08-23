import 'package:delivery_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class Coustombuttomlan extends StatelessWidget {
  final String textbuttom;
  final void Function()? onPressed;
  const Coustombuttomlan({Key? key, required this.textbuttom, this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 100),
            width: double.infinity,
            child: MaterialButton(
              color: Appcolor.primaryColor,
              textColor: Colors.white,
              onPressed: onPressed,
              child: Text(
                textbuttom,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
