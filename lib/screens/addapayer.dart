import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/screens/requestapayment.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class AddAPayer extends StatefulWidget {
  const AddAPayer({Key? key}) : super(key: key);

  @override
  State<AddAPayer> createState() => _AddAPayerState();
}

class _AddAPayerState extends State<AddAPayer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add a payer",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "Cancel",
              style: GoogleFonts.poppins(
                  color: const Color(0xFFF0D75F),
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 28,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                    onTap: () {},
                    child: const CustomOutlineButton(
                      title: "Individual",
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: CustomOutlineBoder(
                  title: "Company",
                  backgroundColor: Colors.white,
                  textColor: AppTheme.buttonColor,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 27,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 30),
                    child: DropdownButton(
                      value: "United Kingdom",
                      items: [
                        DropdownMenuItem(
                          child: Row(
                            children: [
                              Image.asset('assets/images/nigeria.png',height: 30,),
                              SizedBox(width: 10,),
                              Text(
                                "Nigeria",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF1D1D1D),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          value: "United Kingdom",
                        ),
                        DropdownMenuItem(
                            child: Text("Canada"), value: "Canada"),
                        DropdownMenuItem(
                          child: Text("Russia"),
                          value: "Russia",
                        )
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(Icons.keyboard_arrow_down_outlined)),
                      iconEnabledColor: Colors.black, //Icon color
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20),
                      dropdownColor: Colors.white,
                      underline: Container(),
                      isExpanded: true,
                    ))),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CommonTextfield(
              obSecure: false,
              hintText: "",
              labelText: "Mobile Number",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CommonTextfield(
              obSecure: false,
              hintText: "",
              labelText: "Name",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: CommonTextfield(
              obSecure: false,
              hintText: "",
              labelText: "Email",
            ),
          ),
          SizedBox(
            height: size.height * .3,
          ),
          InkWell(
            onTap: () {
              Get.to(RequestAPayment());
            },
            child: CustomOutlineButton(
              title: "Next",
            ),
          ),
        ],
      ),
    );
  }
}
