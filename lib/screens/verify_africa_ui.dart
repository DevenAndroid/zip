import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/resourses/api_constant.dart';

import '../controller/update_user.dart';
import '../routers/my_routers.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
class VerifyAfricaScreen extends StatefulWidget {
  const VerifyAfricaScreen({Key? key}) : super(key: key);

  @override
  State<VerifyAfricaScreen> createState() => _VerifyAfricaScreenState();
}

class _VerifyAfricaScreenState extends State<VerifyAfricaScreen> {
  final formKeyVerify = GlobalKey<FormState>();
  final registorController = Get.put(registerController());

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
    ),
    body: SingleChildScrollView(
    child: Form(
    key: formKeyVerify,
    child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10),
    child: Text(
    "Verify",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 22,
    fontWeight: FontWeight.w500),
    ),
    ),
    SizedBox(
    height: 60,
    ),

      Center(
        child: Container(
          width: 180,
          height: 180,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.primaryColor,width: 3)),
          child: Center(
            child: InkWell(

                onTap: () {

                  registorController.pickImage().then((value){
                    setState(() {

                    });
                  });

                },

                // child: image.path != ""
                //     ?
                //
                child: ClipOval(
                  child: Image.file(
                    registorController.image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Icon(Icons.person,size: 50,),
                  ),
                )),
          ),
        ),
      ),
SizedBox(height: size.height*.4,),
      InkWell(
        onTap: () {
          if(registorController.image.path !=""){
            registorController.  verify(context);
          }
          else{
            showToast("please add photo for verify ");
          }


        },
        child:  CustomOutlineButton(title: "Verify",)),
    ]
    )))));
  }
}
