import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/model_fetch_save_bank.dart';
import '../repository/repo_fetch_save_details.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_error_widget.dart';
class SelectMethod extends StatefulWidget {
  const SelectMethod({Key? key}) : super(key: key);

  @override
  State<SelectMethod> createState() => _SelectMethodState();
}

class _SelectMethodState extends State<SelectMethod> {


  Rx<RxStatus> statusOfGetDetails = RxStatus.empty().obs;
  Rx<ModelFetchSaveBankDetails> getSaveBank= ModelFetchSaveBankDetails().obs;
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
    "Select payment method",
    style: GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 20,
    fontWeight: FontWeight.w500),
    ),

    centerTitle: true,
    ),
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.only(left: 12.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 15,),
      GestureDetector(
        onTap: (){
          Get.toNamed(MyRouters.addPaymentMethod);
        },
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
           child: Icon(Icons.add,size: 30,),
            ),
            SizedBox(width: 13,),
            Text(
              "Add a new payment method",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
         Spacer(),
         Icon(Icons.keyboard_arrow_right_rounded)
          ],
        ),
      ),
      SizedBox(height: 15,),

    Obx(() {
      return statusOfGetDetails.value.isSuccess
          ? ListView.builder(
          itemCount: getSaveBank.value.data!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return
              Column(
                children: [
                  if(getSaveBank.value.data!.isNotEmpty)

                  GestureDetector(
                    onTap: () {
                      Get.toNamed(MyRouters.withdrawlCash);
                    },
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: SvgPicture.asset('assets/images/bank.svg')
                        ),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(

                              getSaveBank.value.data![index].firstName.toString(),
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF1D1D1D),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(

                              getSaveBank.value.data![index].destinationAddress.toString(),
                              style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              );
          }) : statusOfGetDetails.value.isError
          ? CommonErrorWidget(
        errorText: "",
        onTap: () {},
      )
          : const Center(
          child: CircularProgressIndicator());
    })]))));
  }
}

