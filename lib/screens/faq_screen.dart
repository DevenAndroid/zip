import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../models/model_faq.dart';
import '../repository/faq_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';
import 'package:flutter_html/flutter_html.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  Rx<ModelFaq> faq = ModelFaq().obs;
  Rx<RxStatus> statusOffaq = RxStatus.empty().obs;

  Future getFaq() async {
    await faqRepo().then((value) {
      faq.value = value;
      if (value.status == true) {
        statusOffaq.value = RxStatus.success();
        // showToast(value.message.toString());
      } else {
        statusOffaq.value = RxStatus.error();
        // showToast(value.message.toString());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFaq();
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
            "FAQs",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          // actions: [
          // Padding(
          // padding: const EdgeInsets.only(right: 8.0),
          // child: InkWell(
          // onTap: (){
          // // Get.toNamed(MyRouters.fAQScreens);
          // },
          // child: Icon(Icons.search,color: Colors.black,),
          // ),
          // )
          // ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return statusOffaq.value.isSuccess
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: faq.value.data!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: AppTheme.primaryColor,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 1,
                                                  offset: Offset(1, 1))
                                            ]),
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                              dividerColor: Colors.transparent),
                                          child: ExpansionTile(
                                            backgroundColor:
                                                const Color(0xFFFCFBFA),
                                            iconColor: const Color(0xFF07B6CA),
                                            collapsedIconColor:
                                                const Color(0xFF07B6CA),
                                            childrenPadding:
                                                const EdgeInsets.all(1),
                                            title: Text(
                                              "${index + 1}. " +
                                                  faq.value.data![index]
                                                      .question
                                                      .toString(),
                                              style: GoogleFonts.poppins(
                                                color: const Color(0xFF1D1D1D),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                            children: <Widget>[
                                              ListTile(
                                                iconColor:
                                                    const Color(0xFF07B6CA),
                                                isThreeLine: true,
                                                subtitle: Html(
                                                  data: "Answer" +
                                                      faq.value.data![index]
                                                          .answer
                                                          .toString(),
                                                ),
                                                dense: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                })
                            : statusOffaq.value.isError
                                ? CommonErrorWidget(
                                    errorText: "network error",
                                    onTap: () {
                                      getFaq();
                                    },
                                  )
                                : const CommonProgressIndicator();
                      }),
                    ]))));
  }
}
