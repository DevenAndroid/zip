import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Padding(
        padding:  const EdgeInsets.symmetric(
            horizontal: 15, vertical: 40),
        child: Column(
          children: [
            Column(

              children: [

                const Text(
                  'Hi,👋🏻Daniel',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),

                Text(
                  'Welcome to ZIP',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 18,),
                  ),
                ),
                Container(
                  height: size.height*.3,
                  width: size.width*.3,
                  decoration: const BoxDecoration(

                  ),
                )

              ],
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Image(image: AssetImage('assets/icons/questionsmark.png'))
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
