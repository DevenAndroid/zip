import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../models/model_product_airtime.dart';
import '../repository/product_airtime_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';

class BuyAirtimeProductScreen extends StatefulWidget {
  const BuyAirtimeProductScreen({Key? key}) : super(key: key);

  @override
  State<BuyAirtimeProductScreen> createState() =>
      _BuyAirtimeProductScreenState();
}

class _BuyAirtimeProductScreenState extends State<BuyAirtimeProductScreen> {
  Rx<RxStatus> statusOftelcos = RxStatus.empty().obs;
  Rx<AirtimeProductModel> telcos = AirtimeProductModel().obs;
  final profileController = Get.put(ProfileController());
  var code = Get.arguments[0];
  var service = Get.arguments[1];

  getTelcoList() {
    commonProductRepo(
      key: "airtime-product-types",
      code: code,
    ).then((value) {
      log("response.body.....    ${value}");
      telcos.value = value;
      if (value.status == true) {
        statusOftelcos.value = RxStatus.success();
      } else {
        statusOftelcos.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTelcoList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          toolbarHeight: 80,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.0,
            ),
          ),
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
            "AirTime",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return statusOftelcos.value.isSuccess
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: telcos.value.data!.content!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  profileController
                                                          .airtimeController
                                                          .text =
                                                      telcos.value.data!
                                                          .content![index].name
                                                          .toString();
                                                  // controller.idController1.text = chooseBank.value.data![index].code.toString();
                                                  Get.toNamed(
                                                      MyRouters
                                                          .buyAirtimeOperatorScreen,
                                                      arguments: [
                                                        code,
                                                        telcos
                                                            .value
                                                            .data!
                                                            .content![index]
                                                            .productTypeId
                                                            .toString(),
                                                        service
                                                      ]);
                                                },
                                                child: Text(
                                                  telcos.value.data!
                                                      .content![index].name
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xFF1D1D1D),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                })
                            : statusOftelcos.value.isError
                                ? CommonErrorWidget(
                                    errorText: "",
                                    onTap: () {
                                      getTelcoList();
                                    },
                                  )
                                : const CommonProgressIndicator();
                      })
                    ]))));
  }
}
