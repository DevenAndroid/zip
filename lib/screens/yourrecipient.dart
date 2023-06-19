import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources.dart';
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
        title: Text(
          "Add Recipients",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: AppTheme.primaryColor,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search),
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
                  child: CustomOutlineBoder(
                    title: "Add +",
                    backgroundColor: Colors.white,
                    textColor: AppTheme.buttonColor,
                    onPressed: () {},
                  ),
                )),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {},
                      child: const CustomOutlineButton(
                        title: "Favorites +",
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 29,top: 44,bottom: 12),
              child: Text(
                "Your Recipients",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListView.builder(
                itemCount: 9,
                shrinkWrap: true,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(left: 30,right: 28,bottom: 12),
                child: Container(
                  height: 84,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
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
                      SizedBox(
                        width: 55,
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
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
