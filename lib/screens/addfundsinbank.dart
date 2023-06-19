import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class AddFundsInBank extends StatefulWidget {
  const AddFundsInBank({Key? key}) : super(key: key);

  @override
  State<AddFundsInBank> createState() => _AddFundsInBankState();
}

class _AddFundsInBankState extends State<AddFundsInBank> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Funds",
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
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 39,
              ),
              Text(
                "Account Details",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF2E2E2E),
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 26,
              ),
              DecoratedBox(
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
                            value: "United Kingdom",
                            child: Row(
                              children: [
                                Text(
                                  "PPAYCOM(OPAY)",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF1D1D1D),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          const DropdownMenuItem(
                              value: "Canada", child: Text("Canada")),
                          const DropdownMenuItem(
                            value: "Russia",
                            child: Text("Russia"),
                          )
                        ],
                        onChanged: (value) {},
                        icon: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(Icons.keyboard_arrow_down_outlined)),
                        iconEnabledColor: Colors.black, //Icon color
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        dropdownColor: Colors.white,
                        underline: Container(),
                        isExpanded: true,
                      ))),
              const SizedBox(height: 27,),

              CommonTextfield(
                obSecure: false,
                hintText: "",
                labelText: "Account Number",
              ),
              const SizedBox(height: 27,),

              CommonTextfield(
                obSecure: false,
                hintText: "",
                labelText: "Account Name",
              ),
              SizedBox(
                height: size.height * .4,
              ),
              InkWell(
                onTap: () {},
                child: const CustomOutlineButton(
                  title: "Continue",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
