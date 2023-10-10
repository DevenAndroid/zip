import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/PrivicyPolicyModel.dart';
import '../models/model_unfrrze_card.dart';
import '../repository/privacyPolicy_repo.dart';
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  Rx<RxStatus> statusOfGet = RxStatus.empty().obs;
  Rx<PrivacyPolicyModel> getPrivacy = PrivacyPolicyModel().obs;
  getPolicy() {
    privacyPolicyRepo(
      slug: "privacy-policy"
    ).then((value) {
      getPrivacy.value = value;
      if (value.status= true) {

        statusOfGet.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfGet.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPolicy();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Privacy Policy",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
            onTap: () {
              // Get.toNamed(MyRouters.bottomNavbar);
              Get.back();
            },
            child: Icon(Icons.arrow_back)
        ),
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20),
        //     child: Container(
        //       height: 27,
        //       width: 27,
        //       decoration: BoxDecoration(
        //
        //           borderRadius: BorderRadius.circular(5)),
        //       child: Padding(
        //         padding: const EdgeInsets.all(6.0),
        //         child: Image.asset("assets/images/link.png",),
        //       ),
        //     ),
        //   )
        // ],
      ),

      body: Obx(() {
        return  statusOfGet.value.isSuccess?
        SingleChildScrollView(

        child: Column(
          children: [
        Html(


        data:getPrivacy.value.data!.content.toString() ,

        )  ],
        ),
      ) : statusOfGet.value.isError
            ? CommonErrorWidget(
          errorText: getPrivacy.value.message
              .toString(),
          onTap: () {
            // getSentTransitionList();
          },
        )
            : const CommonProgressIndicator();})


    );
  }
}
