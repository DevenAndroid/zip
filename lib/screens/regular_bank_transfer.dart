import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../controller/update_user.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';

class RegularTransfer extends StatefulWidget {
  const RegularTransfer({Key? key}) : super(key: key);

  @override
  State<RegularTransfer> createState() => _RegularTransferState();
}

class _RegularTransferState extends State<RegularTransfer> {
  final registorController = Get.put(registerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      registorController.fetchVritualAccount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.0,
            ),
          ),
          title: InkWell(
            onTap: () {
              print(registorController
                  .fetchAccount.value.data!.kYCInformation!.firstName
                  .toString());
            },
            child: Text(
              "Regular Bank Transfer",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
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
        body: Obx(() {
          return registorController.statusOfFetchAccount.value.isSuccess
              ? SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Image.asset(
                                'assets/images/zip.png',
                                height: 120,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Make a bank transfer from another account using these details.",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF565656),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Account Name",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF7D7D7D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${registorController.fetchAccount.value.data!.kYCInformation!.firstName.toString()}  " +
                                  "${registorController.fetchAccount.value.data!.kYCInformation!.lastName.toString()}",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              "ACCOUNT NUMBER",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF7D7D7D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              registorController
                                  .fetchAccount.value.data!.accountNumber
                                  .toString(),
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              "Bank Name",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF7D7D7D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              registorController.fetchAccount.value.data!
                                  .accountInformation!.bankName
                                  .toString(),
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            InkWell(
                                onTap: () {
                                  Share.share(
                                    "Account Number- ${registorController.fetchAccount.value.data!.accountNumber.toString()}, " +
                                        "Bank Name-  ${registorController.fetchAccount.value.data!.accountInformation!.bankName.toString()}, " +
                                        "Name-  ${registorController.fetchAccount.value.data!.kYCInformation!.firstName.toString()}",
                                    subject: registorController
                                        .fetchAccount.value.data!.accountNumber
                                        .toString(),
                                  );
                                },
                                child: SvgPicture.asset(
                                    'assets/images/share.svg')),
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                      child: Text(
                                        "\$",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Helping you save",
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xFF838383),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "You can use your ZIP Virtual Bank\nAccount just like any other regular\nbank account.",
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xFF343434),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Find out more",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ])))
              : registorController.statusOfFetchAccount.value.isError
                  ? CommonErrorWidget(
                      errorText: registorController.fetchAccount.value.message
                          .toString(),
                      onTap: () {},
                    )
                  : const CommonProgressIndicator();
        }));
  }
}
