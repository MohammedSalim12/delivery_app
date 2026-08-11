import 'package:flutter/material.dart';

class Coustemtextbodyauth extends StatelessWidget {
  final String textbody;
  const Coustemtextbodyauth({Key? key, required this.textbody})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin : EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        textbody,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
