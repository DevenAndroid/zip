import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/bank_delete_model.dart';
import '../models/model_fetch_save_bank.dart';
import '../repository/delete_bank_repo.dart';
import '../repository/repo_fetch_save_details.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_error_widget.dart';

class SelectMethod extends StatefulWidget {
  const SelectMethod({Key? key}) : super(key: key);

  @override
  State<SelectMethod> createState() => _SelectMethodState();
}

class _SelectMethodState extends State<SelectMethod> {
  Rx<RxStatus> statusOfGetDetails = RxStatus.empty().obs;
  Rx<RxStatus> statusOfBank = RxStatus.empty().obs;
  Rx<ModelFetchSaveBankDetails> getSaveBank = ModelFetchSaveBankDetails().obs;
  Rx<deleteBankModel> deleteBank = deleteBankModel().obs;

  getDetails() {
    getSaveBankRepo().then((value) {
      getSaveBank.value = value;
      if (value.status!) {
        statusOfGetDetails.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfGetDetails.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

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
            "Select a Bank Account",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(MyRouters.addPaymentMethod);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Expanded(
                                flex: 5,
                                child: Text(
                                  "+ Add A  New Bank Account",
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF1D1B20),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return statusOfGetDetails.value.isSuccess
                            ? ListView.builder(
                                itemCount: getSaveBank.value.data!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      if (getSaveBank.value.data!.isNotEmpty)
                                        Row(
                                          children: [
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: SvgPicture.asset(
                                                  'assets/images/bank1.svg',
                                                  height: 40,
                                                )),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getSaveBank.value
                                                        .data![index].firstName
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xFF1D1D1D),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    getSaveBank
                                                        .value
                                                        .data![index]
                                                        .destinationAddress
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.grey,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            InkWell(
                                                onTap: () async {
                                                  Get.toNamed(
                                                      MyRouters.withdrawlCash,
                                                      arguments: [
                                                        getSaveBank
                                                            .value
                                                            .data![index]
                                                            .firstName
                                                            .toString(),
                                                        getSaveBank
                                                            .value
                                                            .data![index]
                                                            .destinationAddress
                                                            .toString(),
                                                        getSaveBank
                                                            .value
                                                            .data![index]
                                                            .bankCode
                                                            .toString(),
                                                        getSaveBank
                                                            .value
                                                            .data![index]
                                                            .bankName
                                                            .toString(),
                                                      ]);
                                                },
                                                child: Image.asset(
                                                  "assets/images/vision.png",
                                                  height: 50,
                                                )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (ctx) =>
                                                        AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color: Colors.black,
                                                        size: 50,
                                                      ),
                                                      title: const Text(
                                                        "Delete!",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Graphite",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xFF262E39),
                                                            fontSize: 26),
                                                      ),
                                                      content: const Text(
                                                        "You want to delete your beneficiary",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Graphite",
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: Color(
                                                                0xFF262E39),
                                                            fontSize: 16),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      actions: <Widget>[
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 100,
                                                                child:
                                                                    CustomOutlineButton(
                                                                  title: "No",
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              SizedBox(
                                                                width: 100,
                                                                child:
                                                                    CustomOutlineButton(
                                                                  title: "Yes",
                                                                  onPressed:
                                                                      () {
                                                                    deleteBankRepo(
                                                                      context:
                                                                          context,
                                                                      bank_id: getSaveBank
                                                                          .value
                                                                          .data![
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                      accountNumber: getSaveBank
                                                                          .value
                                                                          .data![
                                                                              index]
                                                                          .destinationAddress
                                                                          .toString(),
                                                                    ).then(
                                                                        (value) {
                                                                      deleteBank
                                                                              .value =
                                                                          value;
                                                                      if (value
                                                                              .status ==
                                                                          true) {
                                                                        statusOfBank.value =
                                                                            RxStatus.success();
                                                                        getDetails();
                                                                        Get.back();
                                                                        showToast(value
                                                                            .message
                                                                            .toString());
                                                                        // getDataList();
                                                                      } else {
                                                                        statusOfBank.value =
                                                                            RxStatus.success();
                                                                        showToast(value
                                                                            .message
                                                                            .toString());
                                                                      }
                                                                      // showToast(value.message.toString());
                                                                    });
                                                                    // Get.to(() => BottomNavbar());
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.black,
                                                  size: 30,
                                                )),
                                            SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  );
                                })
                            : statusOfGetDetails.value.isError
                                ? CommonErrorWidget(
                                    errorText: "",
                                    onTap: () {},
                                  )
                                : const Center(
                                    child: CircularProgressIndicator());
                      })
                    ]))));
  }
}
