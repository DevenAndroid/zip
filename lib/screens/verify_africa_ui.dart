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
  RxInt count = 0.obs;
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
          centerTitle: true,
          title:  Text(
            "Verify With Your Photo",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 22,
                fontWeight: FontWeight.w500),
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

                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Center(
                              child: Text(
                                "Click on Icon to take picture",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF1D1D1D),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Container(
                              width: 160,
                              height: 160,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppTheme.primaryColor, width: 3)),
                              child: Center(
                                child: InkWell(
                                    onTap: () {
                                      registorController
                                          .pickImage()
                                          .then((value) {
                                        setState(() {});
                                      });
                                    },

                                    // child: image.path != ""
                                    //     ?
                                    //
                                    child: ClipOval(
                                      child: Image.file(
                                        registorController.image,
                                        width: 180,
                                        height: 180,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) => const Icon(
                                          Icons.person,
                                          size: 50,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:Border.all(color: Colors.black)
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Image.asset("assets/images/client.jpeg",fit: BoxFit.fill,),
                                ),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.circle,color:AppTheme.secondaryColor,size: 8,),
                                    SizedBox(width: 20,),

                                    Text("Please make sure the image is clear",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF1D1D1D),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.circle,color: AppTheme.secondaryColor,size: 8,),
                                    SizedBox(width: 20,),

                                    Text("Please look directly into the camera\nand stand still",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF1D1D1D),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.circle,color:AppTheme.secondaryColor,size: 8,),
                                    SizedBox(width: 20,),

                                    Text("Please make sure the background is\nwhite or a plain colour",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF1D1D1D),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.circle,color:AppTheme.secondaryColor,size: 8,),
                                    SizedBox(width: 20,),

                                    Text("Remove any eye glasses ",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF1D1D1D),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.circle,color: AppTheme.secondaryColor,size: 8,),
                                    SizedBox(width: 20,),

                                    Text("Remove any face caps, head coverings,\nhats or face masks",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFF1D1D1D),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                SizedBox(height: 5,),
                              ],
                            ),
                          ),
                        ),

                          SizedBox(
                            height: size.height * .02,
                          ),
                          InkWell(
                              onTap: () {



                                if (registorController.image.path != "") {

                                  registorController. saveUserImage(context);
                                  // registorController.   contactCreate(context) ;
                                }
                                else {
                                  showToast("please add photo for verify ");

                                }
                              },
                              child: const CustomOutlineButton(
                                title: "Verify",
                              )),
                        ])))));
  }
}
