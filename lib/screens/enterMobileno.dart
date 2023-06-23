import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/registor_model.dart';
import '../repository/mobile_no_otp_repo.dart';
import '../resourses/api_constant.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {

  final formKey = GlobalKey<FormState>();

  Rx<RxStatus> statusOfLogin = RxStatus.empty().obs;

  Rx<ModelCommonResponse> login = ModelCommonResponse().obs;
  TextEditingController mobileNoController = TextEditingController();
  var initStateBlank = Get.arguments[0];

  Login() {
    loginUserRepo(

      name: Get.arguments[0],
      context: context,
      phone:mobileNoController.text.trim(),
      email:"user@gmail.com"
    ).then((value) {
      login.value = value;
 Get.toNamed(MyRouters.mobileOtpScreen,arguments: [value.data![0].reference.toString()]);


      showToast(value.message.toString());
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
   var userName=  Get.arguments[0];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(

          elevation: 0,
          backgroundColor: Colors.white,


          leading:   InkWell(

            onTap: (){
              Get.back();
            },

            child: const Icon(
              Icons.arrow_back_rounded,color: Colors.black,
              // color: AppTheme.primaryColor,
            ),
          ),),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10),
                      child: Text(
                        "Enter your mobile number to continue",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                              onTap: () {

                              },
                              child: const CustomOutlineButton(
                                title: "Phone Number",
                              )),
                        ),

                        Expanded(
                            child: InkWell(
                              onTap: (){
                                Get.toNamed(MyRouters.enterEmailScreen,arguments: [initStateBlank]);
                              },
                              child: CustomOutlineBoder(
                                title: "Email",
                                backgroundColor: Colors.white,
                                textColor: AppTheme.buttonColor,onPressed: (){
                                Get.toNamed(MyRouters.enterEmailScreen);
                              },),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: AppTheme.primaryColor, width: 1.3),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            const CountryCodePicker(
                              onChanged: print,
                              initialSelection: 'NG',
                              favorite: ['+234', 'NG'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                            const SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: TextFormField(
                                controller: mobileNoController,
                                  decoration: const InputDecoration(
                                    hintText: "XXXXXXXXX",
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Color(0xFF1D1D1D),
                                        fontSize: 16,
                                        decorationColor: Colors.transparent,
                                        decorationThickness: 0,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10),
                      child: Text(
                        "By opening an account, you agree to our",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF1D1D1D),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10),
                      child: Text(
                        "Terms of Use",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFFB5832C),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height:size.height*.35,),

                    InkWell(
                        onTap: (){
                          Login();
                          // Get.toNamed(MyRouters.mobileOtpScreen);
                        },
                        child: CustomOutlineButton(title: "Next",)),
                    SizedBox(height: 15,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(MyRouters.enterEmailScreen);
                      },
                      child: CustomOutlineBoder(title: "Use Email", backgroundColor: Colors.white,textColor: AppTheme.buttonColor,onPressed: (){
                        Get.toNamed(MyRouters.enterEmailScreen);
                      },),
                    ),


                  ]),
            )));
  }
}