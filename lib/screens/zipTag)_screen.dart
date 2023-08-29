import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/update_user.dart';
import '../models/ziptagmodel.dart';
import '../repository/ziptag_repo.dart';
import '../resourses/api_constant.dart';
class TagScreen extends StatefulWidget {
  const TagScreen({Key? key}) : super(key: key);

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  final registorController = Get.put(registerController());

  Rx<RxStatus> statusOfZipTag = RxStatus.empty().obs;
  Rx<ZipTagModel> zipTag = ZipTagModel().obs;

  final formKeyTag = GlobalKey<FormState>();
  checkZipTag() {
    if (formKeyTag.currentState!.validate()) {
      zipTagRepo(
         zip_tag: registorController.zipController.text.trim()+"@zip",


      ).then((value) async {
        zipTag.value = value;
        if (value.status == true) {
          Get.toNamed(MyRouters.extraDetailsScreen);
          statusOfZipTag.value = RxStatus.success();

          showToast(value.message.toString());

        } else {
          statusOfZipTag.value = RxStatus.error();
          showToast(value.message.toString());
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
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
    child: Form(
      key: formKeyTag,
      child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10),
        child: Text(
        "Choose a @Zip Tag, your unique name for getting paid by anyone ",
        style: GoogleFonts.poppins(
        color: const Color(0xFF1D1D1D),
        fontSize: 22,
        fontWeight: FontWeight.w500),
        ),
      ),

      SizedBox(height: 40,),
        CommonTextfield(
            // inputFormatters: [
            //   FilteringTextInputFormatter.allow(
            //       RegExp("[a-z0-9@._-]")),
            //
            // ],
            validator: MultiValidator([
            RequiredValidator(
            errorText:
            'Please enter your tag '),]),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight:Radius.circular(10),bottomRight: Radius.circular(10)) ,),
                child: Text("@zip",style: TextStyle(color: AppTheme.primaryColor,fontWeight: FontWeight.w500,fontSize: 15),),
              ),
            ),

          controller: registorController.zipController,obSecure: false, hintText: "Enter your tag"),
        Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10),
          child: Text(
            "Please enter a tag",
            style: GoogleFonts.poppins(
                color: const Color(0xFFB6B6B6),
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(height: size.height*.52,),
        InkWell(
            onTap: (){
              checkZipTag();
        // Get.toNamed(MyRouters.addressScreen);

            },
            child: CustomOutlineButton(title: "Next",)),


      ]
      )),
    )));
  }
}

