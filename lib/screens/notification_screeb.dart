import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/notification_update_model.dart';
import '../models/setting_modal.dart';
import '../repository/setting_repo.dart';
import '../repository/update_notification_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_colour.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Rx<SettingModal> modalGetSetting = SettingModal().obs;
  bool isSwitched = false;
  getData() {
    settingRepo().then((value) {
      modalGetSetting.value = value;
      if (value.status == true) {
        print(value.message.toString());
      }
    });
  }
  Rx<ModelNotificationUpdate> notificationUpdate = ModelNotificationUpdate().obs;
  Rx<RxStatus> statusOfupdate= RxStatus.empty().obs;
  updateNotificationSetting() {
    updateNotificationRepo(
      context: context,
      email_notification:  modalGetSetting.value.data!.emailNotification! ? "1":"0",
      push_notification:  modalGetSetting.value.data!.pushNotification! ? "1":"0",


    ).then((value) {
      notificationUpdate.value = value;
      if (value.status == true) {
        statusOfupdate.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfupdate.value = RxStatus.error();
        showToast(value.message.toString());


      }
    }

    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
        "Notification",
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
    child: Icon(
    Icons.arrow_back_rounded,
    color: AppTheme.primaryColor,
    ),
    ),
    ),
body: Obx(() {
      return modalGetSetting.value.status==true?
      Column(
  children: [
    const SizedBox(height: 12,),
    Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Push notification",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "Allow Push notification",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 9,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        const Spacer(),

        CupertinoSwitch(
          value: modalGetSetting.value.data!.pushNotification!,
          activeColor: const Color(0xffF0D75F),
          onChanged: (value) {
            setState(() {
              modalGetSetting.value.data!.pushNotification = value;
              updateNotificationSetting();
            });
          },
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    ),
    const SizedBox(height: 12,),
    const Divider(
      thickness: 1,
      color: Color(0x1A000000),),
       SizedBox(height: 12,),
      Row(
        children: [
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email notification",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "Allow Email notification",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 9,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const Spacer(),

          CupertinoSwitch(
            value: modalGetSetting.value.data!.emailNotification!,
            activeColor: const Color(0xffF0D75F),
            onChanged: (value) {
              setState(() {
                modalGetSetting.value.data!.emailNotification = value;
                updateNotificationSetting();
              });
            },
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      const SizedBox(height: 12,),
      const Divider(
        thickness: 1,
        color: Color(0x1A000000),
    ),
  ],
):Center(child: CircularProgressIndicator(),);
}),
    );
  }
}
