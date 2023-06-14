import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class OBScreen extends StatefulWidget {
  const OBScreen({Key? key}) : super(key: key);

  @override
  State<OBScreen> createState() => _OBScreenState();
}

class _OBScreenState extends State<OBScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return  Scaffold(
      body: Column(
        children: [
          SvgPicture.asset((
          'assets/images/ziplogo.svg'
      ),)
        ],
      ),
    );
  }
}
