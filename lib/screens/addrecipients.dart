import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class AddRecipients extends StatefulWidget {
  const AddRecipients({Key? key}) : super(key: key);

  @override
  State<AddRecipients> createState() => _AddRecipientsState();
}

class _AddRecipientsState extends State<AddRecipients> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Recipients",
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
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {},
                child: CustomOutlineBoder(
                  title: "Add Manually",
                  backgroundColor: Colors.white,
                  textColor: AppTheme.buttonColor,
                  onPressed: () {},
                ),
              )),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: InkWell(
                    onTap: () {},
                    child: const CustomOutlineButton(
                      title: "Use @Zip Tag",
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "Zip Account Details",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF2E2E2E),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),

          const SizedBox(
            height: 27,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: CommonTextfield(
              obSecure: false,
              hintText: "@",
              labelText: "ZIP Tag",
            ),
          ),
          SizedBox(
            height: size.height * .5,
          ),
          InkWell(
            onTap: () {Get.toNamed(MyRouters.sendCash);},
            child: const CustomOutlineButton(
              title: "Continue",
            ),
          ),
        ],
      ),
    );
  }
}
