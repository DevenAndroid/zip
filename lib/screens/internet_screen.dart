import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../models/model_data_paln.dart';
import '../models/model_fetch_telcos.dart';
import '../models/save_transastion_model.dart';
import '../repository/data_plan_repo.dart';
import '../repository/fetch_telcos_repo.dart';
import '../repository/save_buy_plan_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';
class InterNetPlanScreen extends StatefulWidget {
  const InterNetPlanScreen({Key? key}) : super(key: key);

  @override
  State<InterNetPlanScreen> createState() => _InterNetPlanScreenState();
}

class _InterNetPlanScreenState extends State<InterNetPlanScreen> {

  Rx<RxStatus> statusOfPlan= RxStatus.empty().obs;
  Rx<ModelDataPlan> dataPlan = ModelDataPlan().obs;
  var initStateBlank = Get.arguments[0];
  getPlanList() {
    dataPlanRepo(
        telco: initStateBlank
    ).then((value) {
      log("response.body.....    ${value}");
      dataPlan.value = value;
      if (value.success == true) {
        statusOfPlan.value = RxStatus.success();

      } else {
        statusOfPlan.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPlanList();
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
            "Data Plan",
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
                        return  statusOfPlan.value.isSuccess ?
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:dataPlan.value.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppTheme.primaryColor)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Plan",
                                                style: GoogleFonts.poppins(
                                                    color: const Color(0xFF1D1D1D),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),),
                                              Text(dataPlan.value.data![index].name.toString(),
                                                style: GoogleFonts.poppins(
                                                    color: const Color(0xFF1D1D1D),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500),),


                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Price",
                                                style: GoogleFonts.poppins(
                                                    color: const Color(0xFF1D1D1D),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500),),
                                              Text(dataPlan.value.data![index].price.toString(),
                                                style: GoogleFonts.poppins(
                                                    color: const Color(0xFF1D1D1D),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),),


                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Validity",
                                                style: GoogleFonts.poppins(
                                                    color: const Color(0xFF1D1D1D),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),),
                                              Text(dataPlan.value.data![index].validity.toString(),
                                                style: GoogleFonts.poppins(
                                                    color: const Color(0xFF1D1D1D),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500),),


                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Data Code",
                                                style: GoogleFonts.poppins(
                                                    color: const Color(0xFF1D1D1D),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500),),
                                              Text(dataPlan.value.data![index].datacode.toString(),
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
                                                    Get.toNamed(MyRouters.purchaseDataScreen,arguments: [initStateBlank,dataPlan.value.data![index].price.toString(),dataPlan.value.data![index].name.toString(),dataPlan.value.data![index].datacode.toString(),]);
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
                                  ),
                                  SizedBox(height: 15,),
                                ],
                              );
                            }):  statusOfPlan.value.isError
                            ? CommonErrorWidget(
                          errorText:
                          dataPlan.value.message.toString(),
                          onTap: () {
                            getPlanList();
                          },
                        )
                            : const CommonProgressIndicator();
                      })

                    ]
                ))));
  }
}
