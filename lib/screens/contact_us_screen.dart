import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/model_get_support_system.dart';
import '../models/model_sumbit_query.dart';
import '../repository/Get_supportsystem_repo.dart';
import '../repository/sumbit_query_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_textfield.dart';
class ContuctUsScreen extends StatefulWidget {
  const ContuctUsScreen({Key? key}) : super(key: key);

  @override
  State<ContuctUsScreen> createState() => _ContuctUsScreenState();
}

class _ContuctUsScreenState extends State<ContuctUsScreen> {
  RxString id = "".obs;
  RxString dropDownValue2 = ''.obs;
  Rx<RxStatus> statusOfsumbit = RxStatus.empty().obs;
  TextEditingController dricptionController = TextEditingController();
  Rx<ModelSumbitQuery> getSupport = ModelSumbitQuery().obs;
  updateSupport() {
    sumbitQueryRepoRepo(
context: context,
      description: dricptionController.text.trim(),
support_category: id.value.toString()

    ).then((value) {
      getSupport.value = value;
      if (value.status == true) {
        // Get.toNamed(MyRouters.bottomNavbar,);
        statusOfsumbit.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfsumbit.value = RxStatus.error();
        showToast(value.message.toString());
      }
    }

    );
  }
    // if(value.status=="success"){
    //   statusOfChooseBank.value.isSuccess;
    // }
    // Get.toNamed(MyRouters.bottomNavbar);






  Rx<RxStatus> statusOfGet = RxStatus.empty().obs;
  Rx<ModelGetSupportSystem> getSupportSystem = ModelGetSupportSystem().obs;
  getTransfer() {
    getSuppotSystemRepo().then((value) {
      getSupportSystem.value = value;
      if (value.status!) {

        statusOfGet.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfGet.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }
  RxInt refreshInt = 0.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTransfer();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Contact US",
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
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        body: Padding(
        padding: const EdgeInsets.all(8.0),
    child: Column(
    children: [
    SizedBox(height: 15,),
      Center(
        child: SizedBox(
          height: 45,
          width: 310,
          child: PopupMenuButton<int>(
            constraints:  BoxConstraints(maxHeight: 600,
              minWidth: MediaQuery.of(context).size.width,

              maxWidth: MediaQuery.of(context).size.width,),

            position: PopupMenuPosition.under,
            offset: Offset.fromDirection(50, 100),
            onSelected: (value) {
              setState(() {
                dropDownValue2.value =
                    getSupportSystem.value.data![value].id.toString();
              });
            },
            // icon: Icon(Icons.keyboard_arrow_down),
            itemBuilder: (context) => List.generate(
              getSupportSystem.value.data!.length,
                  (index) => PopupMenuItem(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          dropDownValue2.value = getSupportSystem.value.data![index].title
                              .toString();
                          id.value = getSupportSystem.value.data![index].id
                              .toString();
                          statusOfGet.value =
                              RxStatus.empty();
                          refreshInt.value =
                              DateTime.now().millisecondsSinceEpoch;
                          setState(() {});
                          Get.back();

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(getSupportSystem
                                        .value.data![index].title
                                        .toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),

            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(8)),
                  border:
                  Border.all(color: AppTheme.secondaryColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            dropDownValue2.value
                                .toString()
                                .isEmpty
                                ? "Select Role"
                                : dropDownValue2.value.toString(),
                            style: const TextStyle(
                                fontSize: 15,
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppTheme.primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 20),
      CommonTextfield(
        // keyboardType:
        // const TextInputType.numberWithOptions(
        //     decimal: true),
        // inputFormatters: [
        //   LengthLimitingTextInputFormatter(8),
        //   FilteringTextInputFormatter.allow(
        //       RegExp('[0-9]+')),
        // ],
        // onChanged: (value) =>
        // doubleVar = double.parse(value),
        // validator: MultiValidator([
        //   RequiredValidator(
        //       errorText:
        //       'Please enter your  number '),
        //   MinLengthValidator(1,
        //       errorText:
        //       'Please enter minumum  8 digit number'),
        //   MaxLengthValidator(8,
        //       errorText:
        //       'Please enter 8 digit number'),
        //   PatternValidator(
        //       r'(^(?:[+0]9)?[0-9]{10,12}$)',
        //       errorText: '')
        // ]),
      controller: dricptionController,
        obSecure: false,
        isMulti: true,
hintText: "",
        labelText: "",
      ),

      SizedBox(height:MediaQuery.of(context).size.height*.14,),

      InkWell(
          onTap: (){
            updateSupport();
            // Get.toNamed(MyRouters.mobileOtpScreen);
          },
          child: CustomOutlineButton(title: "Update",)),
      SizedBox(height: 15,),
    ]
    )));
  }
}
