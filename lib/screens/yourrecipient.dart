import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';


import '../widgets/common_boder_button.dart';
import '../widgets/common_button.dart';

class YourRecipient extends StatefulWidget {
  const YourRecipient({Key? key}) : super(key: key);

  @override
  State<YourRecipient> createState() => _YourRecipientState();
}

class _YourRecipientState extends State<YourRecipient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Add Recipients",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Get.back();
        },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search,color: Colors.black,),
          )
        ],
      ),
      body: SingleChildScrollView(
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
                      onTap: () {},
                      child: const CustomOutlineButton(
                        title: "Add +",
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: CustomOutlineBoder(
                        title: "Favorites +",
                        backgroundColor: Colors.white,
                        textColor: AppTheme.buttonColor,
                        onPressed: () {},
                      ),
                    )),
              ],
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 12),
              child: Text(
                "Your Recipients",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                itemCount: 9,
                shrinkWrap: true,
                itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.addRecipientsStart);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 12),
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xff1D1D1D))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 17,
                        ),
                        const CircleAvatar(
                          backgroundColor: Color(0xffF0D75F),
                          child: Text('JD'),
                          maxRadius: 30,
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Joanne Daniel',
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff1D1D1D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '+234 xxxxxxxxxx',
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
                       Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.arrow_forward_ios,size: 20,),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
