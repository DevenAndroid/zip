import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/resourses/api_constant.dart';

import '../controller/update_user.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';

class VerifyAfricaScreen extends StatefulWidget {
  const VerifyAfricaScreen({Key? key}) : super(key: key);

  @override
  State<VerifyAfricaScreen> createState() => _VerifyAfricaScreenState();
}

class _VerifyAfricaScreenState extends State<VerifyAfricaScreen> {
  final formKeyVerify = GlobalKey<FormState>();
  final registorController = Get.put(registerController());
  RxInt count = 0.obs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
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
          centerTitle: true,
          title: Text(
            "Verify With Your Photo",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: formKeyVerify,
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Center(
                              child: Text(
                                "Click on Icon to take picture",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF1D1D1D),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: DottedBorder(
                              color: Colors.grey,
                              padding: const EdgeInsets.all(10),
                              // Color of the dotted border
                              strokeWidth: 1,
                              borderPadding: const EdgeInsets.all(2),
                              dashPattern: const [6, 3, 2, 3],
                              // Width of the dotted border
                              borderType: BorderType.Rect,
                              // RRect for rounded rectangle, Rect for rectangle
                              radius: const Radius.circular(16),
                              child: InkWell(
                                  onTap: () {
                                    registorController
                                        .pickImage()
                                        .then((value) {
                                      setState(() {});
                                    });
                                  },

                                  // child: image.path != ""
                                  //     ?
                                  //
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.file(registorController.image,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) =>
                                            Image.asset(
                                                "assets/images/camera.png")),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(.3))),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: AppTheme.secondaryColor,
                                        size: 8,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Please make sure the image is clear",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF1D1D1D),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey.withOpacity(.2),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: AppTheme.secondaryColor,
                                        size: 8,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Please look directly into the camera and stand still",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF1D1D1D),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey.withOpacity(.2),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: AppTheme.secondaryColor,
                                        size: 8,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Please make sure the background is white or a plain colour",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF1D1D1D),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey.withOpacity(.2),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: AppTheme.secondaryColor,
                                        size: 8,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Remove any eye glasses ",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF1D1D1D),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey.withOpacity(.2),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: AppTheme.secondaryColor,
                                        size: 8,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Remove any face caps, head coverings,hats or face masks",
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF1D1D1D),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey.withOpacity(.2),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          InkWell(
                              onTap: () {
                                if (registorController.image.path != "") {
                                  registorController.saveUserImage(context);
                                  // registorController.   contactCreate(context) ;
                                } else {
                                  showToast("please add photo for verify ");
                                }
                              },
                              child: const CustomOutlineButton(
                                title: "Verify",
                              )),
                        ])))));
  }
}
