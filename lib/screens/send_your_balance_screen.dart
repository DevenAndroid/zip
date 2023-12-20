import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
class SendYourBalanceScreen extends StatefulWidget {
  const SendYourBalanceScreen({Key? key}) : super(key: key);

  @override
  State<SendYourBalanceScreen> createState() => _SendYourBalanceScreenState();
}

class _SendYourBalanceScreenState extends State<SendYourBalanceScreen> {
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
        padding: const EdgeInsets.only(bottom: 28.0),
        child: InkWell(
            onTap: (){
              if (formKey6.currentState!.validate()) {
                Get.toNamed(MyRouters.requestPaymentContiune,);
              }
            },
            child: const CustomOutlineButton(title: "Send",)),
      ),
      body:  Obx(() {
        return profileController.modal.value.status==true&&profileController.currentBalanceModel.value.status ==true
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
                               profileController.currentBalanceModel.value.data!.currentBalance.toString(),
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
                                  decoration:  BoxDecoration(
                                    border: Border.all(color: Colors.black,width: 2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100)),
                                    color:Colors.white,
                                  ),
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                      imageUrl: profileController.modal.value.data!.user!.profileImage.toString(),
                                      placeholder: (context, url) =>
                                      const Icon(Icons.person,size: 30,),
                                      errorWidget: (context, url, error) =>
                                      const  Icon(Icons.person,size: 50,),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            "${profileController. nameController.text.toString()} ",
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF1D1D1D),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Center(
                          child: Text(
                            profileController. ziptag1Controller.text.toString(),
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
                                (double.tryParse(profileController.currentBalanceModel.value.data!.currentBalance.toString()) ?? 0)) {
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

