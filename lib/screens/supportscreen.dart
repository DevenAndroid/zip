import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routers/my_routers.dart';
import '../widgets/common_colour.dart';
class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
        "24X7 Help Center",
        style: GoogleFonts.poppins(
        color: const Color(0xFF1D1D1D),
    fontSize: 20,
    fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    leading: InkWell(
    onTap: (){
    Get.back();
    },
    child: Icon(
    Icons.arrow_back_rounded,
    color: AppTheme.primaryColor,
    ),
    ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
      children: [
        SizedBox(height: 5,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tell us how we can help ",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
           Image.asset("assets/images/hand.png",height: 20,width: 20,),
            ],
          ),
        ),
        Text(
          "Our Crew of superheroes are standing by for service & support ",
          style: GoogleFonts.poppins(
              color:  Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      SizedBox(height: 25,),
      Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color:   Colors.black26,
                offset: Offset(
                  0.5,
                  0.5,
                ), //Offset
                blurRadius:    0.5,
                spreadRadius: 0.0,
              ), //BoxShadow
            ]
        ),
     child: Column(
       children: [
         SizedBox(height: 5,),
InkWell(
  onTap: (){
    // Get.toNamed(MyRouters.contuctUsScreen);
  },
  child:   Row(

    children: [

      Container(

        padding: EdgeInsets.all(12),

        decoration: BoxDecoration(

          shape: BoxShape.circle,

          color: Colors.black12

        ),

     child: SvgPicture.asset("assets/images/text.svg",width: 20,height: 20,),

      ),

      SizedBox(width: 20,),

      Column(

        mainAxisAlignment: MainAxisAlignment.start,

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text("Chat",

            style: GoogleFonts.poppins(

                color: const Color(0xFF1D1D1D),

                fontSize: 16,

                fontWeight: FontWeight.w500),),

          Text(

            "Start a conversation Now ",

            style: GoogleFonts.poppins(

                color:  Colors.grey,

                fontSize: 12,

                fontWeight: FontWeight.w500),

            textAlign: TextAlign.center,

          ),

        ],

      ),

      Spacer(),

      Icon(Icons.arrow_forward_ios_rounded)





    ],

  ),
),
         SizedBox(height: 25,),
         InkWell(
           onTap: (){
             Get.toNamed(MyRouters.fAQScreens);
           },
           child: Row(
             children: [
               Container(
                 padding: EdgeInsets.all(12),
                 decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.black12
                 ),
                 child: SvgPicture.asset("assets/images/faq.svg",width: 20,height: 20,),
               ),
               SizedBox(width: 20,),
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("FAQs",
                     style: GoogleFonts.poppins(
                         color: const Color(0xFF1D1D1D),
                         fontSize: 16,
                         fontWeight: FontWeight.w500),),
                   Text(
                     "Find inteligent answer instantly ",
                     style: GoogleFonts.poppins(
                         color:  Colors.grey,
                         fontSize: 12,
                         fontWeight: FontWeight.w500),
                     textAlign: TextAlign.center,
                   ),
                 ],
               ),
               Spacer(),
               Icon(Icons.arrow_forward_ios_rounded)


             ],
           ),
         ),
         SizedBox(height: 25,),
         InkWell(
           onTap: (){
             Get.toNamed(MyRouters.contuctUsScreen);
           },
           child: Row(
             children: [
               Container(
                 padding: EdgeInsets.all(12),
                 decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.black12
                 ),
                 child: SvgPicture.asset("assets/images/email.svg",width: 20,height: 20,),
               ),
               SizedBox(width: 20,),
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Email",
                     style: GoogleFonts.poppins(
                         color: const Color(0xFF1D1D1D),
                         fontSize: 16,
                         fontWeight: FontWeight.w500),),
                   Text(
                     "Get A solution beamed to yo ur inbox",
                     style: GoogleFonts.poppins(
                         color:  Colors.grey,
                         fontSize: 12,
                         fontWeight: FontWeight.w500),
                     textAlign: TextAlign.center,
                   ),
                 ],
               ),
               Spacer(),
               Icon(Icons.arrow_forward_ios_rounded)


             ],
           ),
         ),
         SizedBox(height: 5,),
       ],
     ),
      ),






        SizedBox(height: 15,),
      ],
      ),
    ),
    );
  }
}
