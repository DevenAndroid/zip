import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../widgets/common_colour.dart';
class PersonalScreen extends StatefulWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
    appBar: AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: InkWell(
    onTap: () {
    Get.back();
    },
    child: const Icon(
    Icons.arrow_back_rounded,
    color: AppTheme.primaryColor,
    ),
    ),
    title: Text(
    "Personal",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 20,
    fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    ),
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 20,),
      InkWell(
        onTap: (){
          Get.toNamed(MyRouters.profileUpdateScreen);
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Edit Profile",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),),
              InkWell(
                onTap: (){},
                child: Icon(Icons.arrow_forward_ios_outlined,size: 17,),
              )
            ],
          ),
        ),
      ),
      SizedBox(height: 20,),
      InkWell(
        onTap: (){
          Get.toNamed(MyRouters.personalAddress);
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Update Address",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),),
              InkWell(
                onTap: (){},
                child: Icon(Icons.arrow_forward_ios_outlined,size: 17,),
              )
            ],
          ),
        ),
      ),
      SizedBox(height: 20,),
      InkWell(
        onTap: (){
          Get.toNamed(MyRouters.bankDetailsScreen);
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Display Bank Details",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),),
              InkWell(
                onTap: (){},
                child: Icon(Icons.arrow_forward_ios_outlined,size: 17,),
              )
            ],
          ),
        ),
      ),
      SizedBox(height: 20,),
    ]
    ))));
  }
}
