import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class CreateRecipients extends StatefulWidget {
  const CreateRecipients({Key? key}) : super(key: key);

  @override
  State<CreateRecipients> createState() => _CreateRecipientsState();
}

class _CreateRecipientsState extends State<CreateRecipients> {
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
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: AppTheme.primaryColor,
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CommonTextfield(
              obSecure: false,
              hintText: "PPAYCOM(OPAY)",
              labelText: "Select Bank",
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CommonTextfield(
              obSecure: false,
              hintText: "+234 xxxxxxxxxx",
              labelText: "Account Number",
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CommonTextfield(
              obSecure: false,
              hintText: "Account Name",
              labelText: "Joanne Daniel",
            ),
          ),
          SizedBox(
            height: size.height * .3,
          ),
          InkWell(
            onTap: () {},
            child: const CustomOutlineButton(
              title: "Continue",
            ),
          ),
        ],
      ),
    );
  }
}
