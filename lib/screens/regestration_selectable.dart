import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
class SelectableScreen extends StatefulWidget {
  const SelectableScreen({Key? key}) : super(key: key);

  @override
  State<SelectableScreen> createState() => _SelectableScreenState();
}

class _SelectableScreenState extends State<SelectableScreen> {
  @override
  int currentDrawer = 0;

  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          leading:   InkWell(

            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),),
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text(
        "What is primary purpose for using Zip?",
        style: GoogleFonts.poppins(
            color: const Color(0xFF1D1D1D),
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ),
     SizedBox(height: 20,),


        GestureDetector(
          onTap: (){
            setState(() {
               currentDrawer = 0;
            });
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              decoration:   currentDrawer == 0 ?  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.secondaryColor ,width: 1.3)
              ):  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:AppTheme.buttonColor ,width: 1.3)
              ),
          child: Padding(
            padding: const EdgeInsets.only(left: 9.0,top: 12),
            child: Text("Family Support"),
          ),

          ),
        ),
      SizedBox(height: 15,),

      GestureDetector(
        onTap: (){
          setState(() {
            currentDrawer = 1;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration:   currentDrawer == 1 ?  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:AppTheme.secondaryColor,width: 1.3)
          ):  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:  AppTheme.buttonColor,width: 1.3)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 9.0,top: 12),
            child: Text("Buy Airtime & Pay Bills"),
          ),

        ),
      ),
      SizedBox(height: 15,),

      GestureDetector(
        onTap: (){
          setState(() {
            currentDrawer = 2;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration:   currentDrawer == 2 ?  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:AppTheme.secondaryColor,width: 1.3)
          ):  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:  AppTheme.buttonColor,width: 1.3)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 9.0,top: 12),
            child: Text("Buy Goods & Services"),
          ),

        ),
      ),
      SizedBox(height: 15,),

      GestureDetector(
        onTap: (){
          setState(() {
            currentDrawer = 3;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration:   currentDrawer == 3 ?  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:AppTheme.secondaryColor,width: 1.3)
          ):  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:  AppTheme.buttonColor,width: 1.3)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 9.0,top: 12),
            child: Text("My Business"),
          ),

        ),
      ),
      SizedBox(height: 15,),
      GestureDetector(
        onTap: (){
          setState(() {
            currentDrawer = 4;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration:   currentDrawer == 4?  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:AppTheme.secondaryColor,width: 1.3)
          ):  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:  AppTheme.buttonColor,width: 1.3)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 9.0,top: 12),
            child: Text("Saving & Investing"),
          ),

        ),
      ),
      SizedBox(height: size.height*.3,),
      GestureDetector(
          onTap: (){
          Get.toNamed(MyRouters.userScreen);
          },
          child: CustomOutlineButton(title: "Next",)),

    ]
    )))
    );
  }
}
