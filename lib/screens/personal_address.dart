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
import '../models/get_address_model.dart';
import '../models/model_update_address.dart';
import '../repository/get_address_repo.dart';
import '../repository/update_address_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';
class PersonalAddress extends StatefulWidget {
  const PersonalAddress({Key? key}) : super(key: key);

  @override
  State<PersonalAddress> createState() => _PersonalAddressState();
}

class _PersonalAddressState extends State<PersonalAddress> {

  TextEditingController streetController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController additionalController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  Rx<RxStatus> statusOfaddress = RxStatus.empty().obs;
  Rx<ModelUpdateAddress> userAdderss = ModelUpdateAddress().obs;
  final formKeyAddressField = GlobalKey<FormState>();

  final registorController = Get.put(registerController());
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
      phone: registorController.molileController.toString()



    ).then((value) {
      userAdderss.value = value;
      if (value.status == true) {
        // Get.toNamed(MyRouters.countryScreen);
        statusOfaddress.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfaddress.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }

    );
  }

  Rx<RxStatus> statusOfGetAddress = RxStatus.empty().obs;
  Rx<GetAddressModel> getaddress = GetAddressModel().obs;
  getPersonalAddress() {
    getAddressRepo().then((value) {
      getaddress.value = value;
      if (value.status == true) {
        statusOfGetAddress.value = RxStatus.success();
        showToast(value.message.toString());
        if(value.data != null){
          streetController.text = (getaddress.value.data!.streetName??"").toString();
          additionalController.text = (getaddress.value.data!.additional??"").toString();
          cityController.text = (getaddress.value.data!.city??"").toString();
          countryController.text = (getaddress.value.data!.country??"").toString();
          houseNoController.text = (getaddress.value.data!.houseNumber??"").toString();
          postalCodeController.text = (getaddress.value.data!.postalCode??"").toString();
          stateController.text = (getaddress.value.data!.state??"").toString();
        }
      } else {
        statusOfGetAddress.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPersonalAddress();
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
title: Text(
  "Home address ",
  style: GoogleFonts.poppins(
      color: const Color(0xFF1D1D1D),
      fontSize: 22,
      fontWeight: FontWeight.w500),
),
          centerTitle: true,

        ),
        body:Obx(() {
      return  statusOfGetAddress.value.isSuccess ?
            SingleChildScrollView(
            child: Form(
              key:  formKeyAddressField,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        const SizedBox(height: 30,),
                        CommonTextfield(
                          controller: streetController,
                          obSecure: false, labelText: "Street Name", hintText: '',  validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter Street N ame  '),
                        ]),),
                        const SizedBox(height: 15,),
                        CommonTextfield(
                          controller: houseNoController,
                          obSecure: false, labelText: "House Number", hintText: '', validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter House Number '),
                        ]),),
                        const SizedBox(height: 15,),
                        CommonTextfield(
                          controller: additionalController,
                          obSecure: false, labelText: "Additional", hintText: '', validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter Additional '),
                        ]),),
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

                          ]),
                          controller: postalCodeController,
                          obSecure: false, labelText: "Postal Code", hintText: ' ',),
                        const SizedBox(height: 15,),
                        CommonTextfield(
                          controller: stateController,
                          obSecure: false, labelText: "Region/state", hintText: '',  validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Please enter Region/state '),
                        ]),),
                        const SizedBox(height: 15,),
                        CommonTextfield(
                          controller: cityController,
                          obSecure: false, labelText: "City", hintText: '',validator: MultiValidator([
                          RequiredValidator(errorText: 'Please enter City '),
                        ]),),
                        const SizedBox(height: 15,),
                        CommonTextfield(
                          controller: countryController,
                          obSecure: false, labelText: "Country", hintText: '',  validator: MultiValidator([
                          RequiredValidator(errorText: 'Please enter Country '),
                        ]),),
                        SizedBox(height: size.height*.1,),
                        InkWell(
                            onTap: (){
                              if (formKeyAddressField.currentState!.validate()) {
                                updateUserAddress();
                              }

                            },
                            child: const CustomOutlineButton(title: "Update Address",)),

                      ]
                  )),
            )):  statusOfGetAddress.value.isError
          ? CommonErrorWidget(
        errorText:
        getaddress.value.message.toString(),
        onTap: () {
          getPersonalAddress();
        },
      )
          : const CommonProgressIndicator();}));
  }
}

