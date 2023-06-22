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
        backgroundColor: Colors.white,
        elevation: 0,
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
            padding: const EdgeInsets.only(right: 20,top: 20),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
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
            const SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 30),
                      child: DropdownButton(
                        value: "United Kingdom",
                        items: [
                          DropdownMenuItem(
                            child: Row(
                              children: [
                                Image.asset('assets/images/nigeria.png',height: 30,),
                                const SizedBox(width: 10,),
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
                          const DropdownMenuItem(
                              child: Text("Canada"), value: "Canada"),
                          const DropdownMenuItem(
                            child: Text("Russia"),
                            value: "Russia",
                          )
                        ],
                        onChanged: (value) {},
                        icon: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(Icons.keyboard_arrow_down_outlined)),
                        iconEnabledColor: Colors.black, //Icon color
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20),
                        dropdownColor: Colors.white,
                        underline: Container(),
                        isExpanded: true,
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                obSecure: false,
                hintText: "",
                labelText: "Mobile Number",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: CommonTextfield(
                obSecure: false,
                hintText: "",
                labelText: "Name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
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
                Get.to(const RequestAPayment());
              },
              child: const CustomOutlineButton(
                title: "Next",
              ),
            ),
        const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
