import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';
class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
    appBar: AppBar(
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
    actions: [
    Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: InkWell(
    onTap: (){
    // Get.toNamed(MyRouters.fAQScreens);
    },
    child: Icon(Icons.search),
    ),
    )
    ],
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

      ListView.builder(
          shrinkWrap: true,
          physics:
          const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color:
                       Colors.white,
                      border: Border.all(color: AppTheme.primaryColor,width: 1),
                      borderRadius:
                      BorderRadius.circular(
                          15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 1,
                            offset: Offset(1, 1))
                      ]),
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(
                        dividerColor: Colors
                            .transparent),
                    child: ExpansionTile(
                      backgroundColor:
                      const Color(0xFFFCFBFA),
                      iconColor:
                      const Color(0xFF07B6CA),
                      collapsedIconColor:
                      const Color(0xFF07B6CA),
                      childrenPadding:
                      const EdgeInsets.all(1),
                      title: Text(
                        "Where can I download the ZIP mobile application",
                        style:
                        GoogleFonts.poppins(
                          color: const Color(
                              0xFF1D1D1D),
                          fontWeight:
                          FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      children: <Widget>[
                        ListTile(
                          iconColor: const Color(
                              0xFF07B6CA),
                          isThreeLine: true,
                          subtitle: Text(
                            'Enim perferendis quia eaque corrupti. Aut non quisquamlaboriosam ut minus. Quidem sit facere et cum fuga eosdeserunt odio. Consectetur deleniti est veniam. Voluptasatque et expedita illum.',
                            style: GoogleFonts
                                .poppins(
                              color: const Color(
                                  0xFFBBBBBB),
                              fontWeight:
                              FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                          dense: true,
                        ),
                      ],
                    ),
                  ),
                ),
             SizedBox(height: 20,),
              ],
            );
          }),

    ]
    ))));
  }
}

