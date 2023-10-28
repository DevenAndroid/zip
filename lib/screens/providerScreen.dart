import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/resourses/api_constant.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../models/model_cabel_providers.dart';
import '../models/model_data_paln.dart';
import '../models/model_fetch_telcos.dart';
import '../repository/data_plan_repo.dart';
import '../repository/fetch_provider_repo.dart';
import '../repository/fetch_telcos_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';
class ProviderScreen extends StatefulWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  final profileController = Get.put(ProfileController());
  Rx<RxStatus> statusOfProviders= RxStatus.empty().obs;
  Rx<ModelCabelProvider> cabelProvider = ModelCabelProvider().obs;
  var initStateBlank = Get.arguments[0];
  getProviderList() {
    providerRepo(
        provider: initStateBlank
    ).then((value) {
      log("response.body.....    ${value}");
      cabelProvider.value = value;
      if (value.success == true) {
        statusOfProviders.value = RxStatus.success();
      } else {
        statusOfProviders.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProviderList();
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
            "Provider",
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
                        return  statusOfProviders.value.isSuccess ?
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:cabelProvider.value.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Provider  Plan",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF1D1D1D),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),),
                                        Text(cabelProvider.value.data![index].name.toString(),
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF1D1D1D),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),),


                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      children: [


    ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    itemCount:cabelProvider.value.data![index].availablePricingOptions!.length,
    shrinkWrap: true,
    itemBuilder: (context, index1) {
      return  Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppTheme.primaryColor)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Invoice Period",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),),
                    Text(cabelProvider.value.data![index].availablePricingOptions![index1].invoicePeriod.toString(),
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),),


                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Months Paid For",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),),
                    Text(cabelProvider.value.data![index].availablePricingOptions![index1].monthsPaidFor.toString(),
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),),


                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),),
                    Text(cabelProvider.value.data![index].availablePricingOptions![index1].price.toString(),
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),),


                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Code",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 15,
                          fontWeight: FontWeight.w500),),
                    Text(cabelProvider.value.data![index].code.toString(),
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),),


                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: (){
                          print(cabelProvider.value.data![index].availablePricingOptions![index1].price);
                          print(profileController
                              .currentBalanceModel
                              .value
                              .data);
if(cabelProvider.value.data![index].availablePricingOptions![index1].price < profileController
    .currentBalanceModel
    .value
    .data){
  Get.toNamed(MyRouters.purchaseCabelScreen,arguments: [cabelProvider.value.data![index].availablePricingOptions![index1].price.toString(),cabelProvider.value.data![index].availablePricingOptions![index1].monthsPaidFor.toString(),cabelProvider.value.data![index].code.toString(),initStateBlank.toString(),]);

}
else{
  showToast("inefficient balance");
}


                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AppTheme.secondaryColor,
                            ),

                            child: Text("Buy Plan ",
                              style: GoogleFonts.poppins(
                                  color:  Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),))),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
        ],
      );

    }),




                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                ],
                              );
                            }):  statusOfProviders.value.isError
                            ? CommonErrorWidget(
                          errorText:
                          cabelProvider.value.message.toString(),
                          onTap: () {
                            getProviderList();
                          },
                        )
                            : Center(child: const CommonProgressIndicator());
                      })

                    ]
                ))));
  }
}
