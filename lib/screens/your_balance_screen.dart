  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
class YourBalanceScreen extends StatefulWidget {
  const YourBalanceScreen({Key? key}) : super(key: key);

  @override
  State<YourBalanceScreen> createState() => _YourBalanceScreenState();
}

class _YourBalanceScreenState extends State<YourBalanceScreen> {
  final profileController = Get.put(ProfileController());
  final formKey6 = GlobalKey<FormState>();
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
    "Your Balance",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 20,
    fontWeight: FontWeight.w500),
    ),

    centerTitle: true,
    ),
    bottomNavigationBar:    Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: InkWell(
          onTap: (){
            if (formKey6.currentState!.validate()) {

              Get.toNamed(MyRouters.paymentLink,arguments: [profileController.amountController.text.toString() ,profileController.requestNameController.text.toString(),profileController.requestemailController.text.toString(),]);
              // Get.toNamed(MyRouters.requestAPaymentContiune,);
            }
          },
          child: const CustomOutlineButton(title: "Send",)),
    ),
    body:  Obx(() {
      return profileController.currentBalanceModel.value.status ==true
          ?

      SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Form(
      key: formKey6,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Center(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.network("https://cdn-icons-png.flaticon.com/512/32/32974.png",color: Colors.black,width: 15,height: 15,),

        Text(
         profileController. currentBalanceModel.value.data.toString(),
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),],
      ),
        ),
        const SizedBox(height: 20,),
        Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(
                      right: size.width * .01, left: size.width * .015),
                  child: CircleAvatar(
                    radius: size.height * .07,
                    backgroundImage: const NetworkImage(
                        'https://www.pngitem.com/pimgs/m/128-1284293_marina-circle-girl-picture-in-circle-png-transparent.png'),
                  ),
                ),
              ),

            ],
          ),
        ),
        Center(
          child: Text(
            "${profileController.requestNameController.text.toString()}",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
        ),
        Center(
          child: Text(
            profileController.requestZiptag1Controller.text.toString(),
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 16,
                fontWeight: FontWeight.w300),
          ),
        ),
        const SizedBox(
          height: 29,
        ),
        const SizedBox(height: 18,),
CommonTextfield(
  controller:profileController.amountController ,
  obSecure: false, hintText: "",labelText: "Enter amount",
  validator: (value) {
      if (value!.trim().isEmpty) {
        return "Please enter amount";
      }
      if (double.tryParse(value.trim()) == null) {
        return "Enter valid amount";
      }
      if (double.parse(value.trim()) >
          (double.tryParse(profileController.currentBalanceModel.value.data.toString()) ?? 0)) {
        return "Please enter amount less than balance ";
      }
  },
),
  const SizedBox(height: 14,),
        CommonTextfield(
          controller:profileController.noteController ,
          obSecure: false, hintText: "",labelText: "Note",),

        const SizedBox(height: 10,),






   ]),
    )))   : const Center(
        child: CircularProgressIndicator(),
      );
    }),);
  }
}

