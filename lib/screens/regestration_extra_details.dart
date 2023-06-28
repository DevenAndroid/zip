import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../models/model_update_address.dart';
import '../repository/update_address_repo.dart';
import '../resourses/api_constant.dart';
class ExtraDetailsScreen extends StatefulWidget {
  const ExtraDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ExtraDetailsScreen> createState() => _ExtraDetailsScreenState();
}

class _ExtraDetailsScreenState extends State<ExtraDetailsScreen> {

  TextEditingController streetController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController additionalController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  Rx<RxStatus> statusOfaddress = RxStatus.empty().obs;
  Rx<ModelUpdateAddress> userAdderss = ModelUpdateAddress().obs;


  updateUserAddress() {
    updateAddressRepo(
street_name: streetController.text.trim(),
      context: context,
      additional:additionalController.text.trim(),
      city: cityController.text.trim(),
      country: countryController.text.trim(),
      house_number: houseNoController.text.trim(),
      postal_code: postalCodeController.text.trim(),
      state: stateController.text.trim(),



    ).then((value) {
      userAdderss.value = value;
      if (value.status == true) {
        Get.toNamed(MyRouters.countryScreen);
        statusOfaddress.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfaddress.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }

    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double doubleVar;
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
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),

          ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0,right: 10),
            child: InkWell(
              onTap: (){
                Get.toNamed(MyRouters.countryScreen);
              },
              child: Text(
                "Skip",
                style: GoogleFonts.poppins(
                    color: const Color(0xFFF0D75F),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],

        ),
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
                          "Please add any extra details to complete this  ",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 40,),
                      CommonTextfield(
controller: streetController,
                        obSecure: false, labelText: "Street Name", hintText: '',),
                      const SizedBox(height: 15,),
                      CommonTextfield(
                        controller: houseNoController,
                        obSecure: false, labelText: "House Number", hintText: '',),
                      const SizedBox(height: 15,),
                      CommonTextfield(
                        controller: additionalController,
                        obSecure: false, labelText: "Additional", hintText: '',),
                      const SizedBox(height: 15,),
                      CommonTextfield(
                        keyboardType:
                        const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9]+')),
                        ],
                        onChanged: (value) =>
                        doubleVar = double.parse(value),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText:
                              'Please enter your postal code '),
                          MinLengthValidator(6,
                              errorText:
                              'Please enter 6 digit postal code'),
                          MaxLengthValidator(6,
                              errorText:
                              'Please enter 6 digit postal code'),
                          PatternValidator(
                              r'(^(?:[+0]9)?[0-9]{10,12}$)',
                              errorText: '')
                        ]),
controller: postalCodeController,
                        obSecure: false, labelText: "Postal Code", hintText: ' ',),
                      const SizedBox(height: 15,),
                      CommonTextfield(
                        controller: stateController,
                        obSecure: false, labelText: "Region/state", hintText: '',),
                      const SizedBox(height: 15,),
                      CommonTextfield(
                        controller: cityController,
                        obSecure: false, labelText: "City", hintText: '',),
                      const SizedBox(height: 15,),
                      CommonTextfield(
                        controller: countryController,
                        obSecure: false, labelText: "Country", hintText: '',),
                      SizedBox(height: size.height*.1,),
                      InkWell(
                          onTap: (){
                            updateUserAddress();

                          },
                          child: const CustomOutlineButton(title: "Next",)),

                    ]
                ))));
  }
}

