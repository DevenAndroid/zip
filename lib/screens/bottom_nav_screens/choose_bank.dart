import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../../controller/update_user.dart';
import '../../models/model_choose_bank.dart';
import '../../repository/choose_bank_repo.dart';
import '../../resourses/api_constant.dart';
import '../../widgets/common_error_widget.dart';

class ChooseBank extends StatefulWidget {
  const ChooseBank({Key? key}) : super(key: key);

  @override
  State<ChooseBank> createState() => _ChooseBankState();
}

class _ChooseBankState extends State<ChooseBank> {
  Rx<RxStatus> statusOfChooseBank = RxStatus.empty().obs;

  Rx<ChooseBankList> chooseBank = ChooseBankList().obs;

  ChooseBankApi() {
    chooseBankRepo(
        // country: "NG", currency: "NGN"
    ).then((value) {
      chooseBank.value = value;

      if (value.success == true) {
        statusOfChooseBank.value = RxStatus.success();
      } else {
        statusOfChooseBank.value = RxStatus.error();
      }

      // showToast(value.message.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChooseBankApi();
  }

  final controller = Get.put(registerController());
  final TextEditingController search1Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              // color: AppTheme.primaryColor,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Choose Bank",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextfield(
                        controller: search1Controller,
                        obSecure: false,
                        hintText: "Search for a bank",
                        prefix: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: SvgPicture.asset(
                            "assets/images/Search.svg",
                            width: 10,
                          ),
                        ),
                        onTap: (){
                          setState(() {

                          });
                        },
                        onChanged: (gt){
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        List<Data> searchData=[];
                        if(statusOfChooseBank.value.isSuccess && chooseBank.value.data!= null){
    String search = search1Controller.text.trim().toLowerCase();
    if(search.isNotEmpty) {
      searchData = chooseBank.value.data!.where((element) => element.name.toString().toLowerCase().contains(search)
          ).toList();
    } else {
      searchData = chooseBank.value.data!;
    }
                        }
                        return statusOfChooseBank.value.isSuccess
                            ? ListView.builder(
                                itemCount: searchData.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final item = searchData[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.bankController.text = item.name.toString();
                                            controller.idController1.text = item.code.toString();
                                            print("tget"+controller.idController1.text);
                                            Get.toNamed(MyRouters.sendCash2,
                                                arguments: [item.name.toString(),item.code.toString()]);
                                          },
                                          child: Text(
                                            item.name
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xFF1D1D1D),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                      ],
                                    ),
                                  );
                                })
                            : statusOfChooseBank.value.isError
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
