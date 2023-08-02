import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';
import 'package:zip/widgets/common_textfield.dart';


import '../controller/payout_controller.dart';
import '../models/model_get_binificery.dart';
import '../models/modelbenificerylist.dart';
import '../repository/benificery_list _repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';
import '../widgets/common_error_widget.dart';

class YourRecipient extends StatefulWidget {
  const YourRecipient({Key? key}) : super(key: key);

  @override
  State<YourRecipient> createState() => _YourRecipientState();
}

class _YourRecipientState extends State<YourRecipient> {
  final payoutController = Get.put(PayoutController());
  final TextEditingController searchController = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    payoutController. getDataList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Beneficiaries",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),

      ),
      body:  RefreshIndicator(
      color: Colors.white,
      backgroundColor: AppTheme.primaryColor,
      onRefresh: () async {
        payoutController.getDataList();


      },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
Get.toNamed(MyRouters.sendCash2);

                        },
                        child: const CustomOutlineButton(
                          title: "ADD +",
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: InkWell(
                        onTap: () {



                        },
                        child: CustomOutlineBoder(
                          title: "Favorites +",
                          backgroundColor: Colors.white,
                          textColor: AppTheme.buttonColor,
                          onPressed: () {},
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 12),
                child: Text(
                  "Your Recipients",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5.0,right: 5),
                child: CommonTextfield(
                  obSecure: false,
                  hintText: "Search",
                  controller: searchController,
                  suffixIcon: InkWell(
                    onTap: (){
                      setState(() {});
                    },

                    child: Icon(Icons.search)),
                  onChanged: (gt){
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 20,),
              Obx(() {
                List<Results> results = [];
                if(payoutController.statusOfList.value.isSuccess && payoutController.addRecipitentsList.value.data!.results != null){
                  String search = searchController.text.trim().toLowerCase();
                  if(search.isNotEmpty) {
                    results =
                        payoutController.addRecipitentsList.value.data!.results!
                            .where((element) =>
                        element.firstName.toString().toLowerCase().contains(
                            search) ||
                            element.lastName.toString().toLowerCase().contains(
                                search) ||
                            element.email.toString().toLowerCase().contains(
                                search) ||
                            element.phoneNumber.toString()
                                .toLowerCase()
                                .contains(search) ||
                            element.address.toString().toLowerCase().contains(
                                search)
                        ).toList();
                  } else {
                    results = payoutController.addRecipitentsList.value.data!.results!;
                  }
                }
                return  payoutController.statusOfList.value.isSuccess ?
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: results.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = results[index];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                            Get.toNamed(MyRouters.payNowBalance,arguments: item);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 12),
                              child: Container(
                                height: 75,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        color: const Color(0xff1D1D1D))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 17,
                                    ),
                                     CircleAvatar(
                                      backgroundColor: const Color(0xffF0D75F),
                                      maxRadius: 30,
                                      child: Text(item.firstName!.toString().trim().substring(0,1)),
                                    ),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.firstName!.toString(),
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xff1D1D1D),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),

                                        Text(
                                          item.sId!.toString(),
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xff1D1D1D),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          'ZIP',
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xffB2B2B2),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.arrow_forward_ios, size: 20,),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }):  payoutController.statusOfList.value.isError
                    ? CommonErrorWidget(
                  errorText:
                  payoutController.addRecipitentsList.value.message.toString(),
                  onTap: () {
                    payoutController.getDataList();
                  },
                )
                    : const CommonProgressIndicator();
              })
            ],
          ),
        ),
      ),
    );
  }
}
