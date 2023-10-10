import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';
import '../widgets/common_colour.dart';
class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  void handleFreshchatNotification(Map<String, dynamic> message) async {
    if (await Freshchat.isFreshchatNotification(message)) {
      print("is Freshchat notification");
      Freshchat.handlePushNotification(message);
    }
  }

  Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
    print("Inside background handler");
    await Firebase.initializeApp();
    handleFreshchatNotification(message.data);
  }
  int _counter = 0;
  final GlobalKey<ScaffoldState>? _scaffoldKey = new GlobalKey<ScaffoldState>();

  void registerFcmToken() async {
    if (Platform.isAndroid) {
      String? token = await FirebaseMessaging.instance.getToken();
      print("FCM Token is generated $token");
      Freshchat.setPushRegistrationToken(token!);
    }
  }

  void restoreUser(BuildContext context) {
    var externalId, restoreId, obtainedRestoreId;
    var alert = AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: const Text(
        "Identify/Restore User",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontFamily: 'OpenSans-Regular'),
      ),
      content: Form(
        child: Column(
          children: [
            TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "External ID",
                ),
                onChanged: (val) {
                  setState(() {
                    externalId = val;
                  });
                }),
            TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Restore ID",
                ),
                onChanged: (val) {
                  setState(() {
                    restoreId = val;
                  });
                }),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialButton(
              elevation: 10.0,
              child: const Text(
                "Identify/Restore",
                textDirection: TextDirection.ltr,
              ),
              onPressed: () {
                setState(
                      () {
                    Freshchat.identifyUser(
                        externalId: externalId, restoreId: restoreId);
                    Navigator.of(context, rootNavigator: true).pop(context);
                  },
                );
              },
            ),
            MaterialButton(
              elevation: 10.0,
              child: const Text(
                "Cancel",
                textDirection: TextDirection.ltr,
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context, rootNavigator: true).pop(context);
                });
              },
            ),
          ],
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void notifyRestoreId(var event) async {
    FreshchatUser user = await Freshchat.getUser;
    String? restoreId = user.getRestoreId();
    if (restoreId != null) {
      Clipboard.setData(new ClipboardData(text: restoreId));
      // showToast("Restore ID copied: $restoreId");
    }
  }
  void getUserProps(BuildContext context) {
    final _userInfoKey = new GlobalKey<FormState>();
    String? key, value;
    var alert = AlertDialog(
      scrollable: true,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: const Text(
        "Custom User Properties:",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontFamily: 'OpenSans-Regular'),
      ),
      content: Form(
        key: _userInfoKey,
        child: Column(
          children: [
            TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Key",
                ),
                onChanged: (val) {
                  setState(() {
                    key = val;
                  });
                }),
            TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Value",
                ),
                onChanged: (val) {
                  setState(() {
                    value = val;
                  });
                }),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialButton(
              elevation: 10.0,
              child: const Text(
                "Add Properties",
                textDirection: TextDirection.ltr,
              ),
              onPressed: () {
                setState(() {
                  Map map = {key: value};
                  Freshchat.setUserProperties(map);
                });
              },
            ),
            MaterialButton(
              elevation: 10.0,
              child: const Text(
                "Cancel",
                textDirection: TextDirection.ltr,
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context, rootNavigator: true).pop(context);
                });
              },
            ),
          ],
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
  void sendMessageApi(BuildContext context) {
    final _userInfoKey = new GlobalKey<FormState>();
    String? conversationTag, message;
    var alert = AlertDialog(
      scrollable: true,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: const Text(
        "Send Message API",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontFamily: 'OpenSans-Regular'),
      ),
      content: Form(
        key: _userInfoKey,
        child: Column(
          children: [
            TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Conversation Tag",
                ),
                onChanged: (val) {
                  setState(() {
                    conversationTag = val;
                  });
                }),
            TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Message",
                ),
                onChanged: (val) {
                  setState(() {
                    message = val;
                  });
                }),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialButton(
              elevation: 10.0,
              child: const Text(
                "Send Message",
                textDirection: TextDirection.ltr,
              ),
              onPressed: () {
                setState(
                      () {
                    Freshchat.sendMessage(conversationTag!, message!);
                    Navigator.of(context, rootNavigator: true).pop(context);
                  },
                );
              },
            ),
            MaterialButton(
              elevation: 10.0,
              child: const Text(
                "Cancel",
                textDirection: TextDirection.ltr,
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context, rootNavigator: true).pop(context);
                });
              },
            ),
          ],
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  String APP_ID = "431459d3-abb1-42b0-bc2c-d10e0c015fe2",
      APP_KEY = "c26327ca-832c-4ab2-8715-67f0760c8f0a",
      DOMAIN = "msdk.eu.freshchat.com";
  void initState() {
    super.initState();
    Freshchat.init(APP_ID, APP_KEY, DOMAIN);
    /**
     * This is the Firebase push notification server key for this sample app.
     * Please save this in your Freshchat account to test push notifications in Sample app.
     *
     * Server key: Please refer support documentation for the server key of this sample app.
     *
     * Note: This is the push notification server key for sample app. You need to use your own server key for testing in your application
     */
    var restoreStream = Freshchat.onRestoreIdGenerated;
    var restoreStreamSubsctiption = restoreStream.listen((event) {
      print("Restore ID Generated: $event");
      notifyRestoreId(event);
    });

    var unreadCountStream = Freshchat.onMessageCountUpdate;
    unreadCountStream.listen((event) {
      print("Have unread messages: $event");
    });

    var userInteractionStream = Freshchat.onUserInteraction;
    userInteractionStream.listen((event) {
      print("User interaction for Freshchat SDK");
    });

    if (Platform.isAndroid) {
      registerFcmToken();
      FirebaseMessaging.instance.onTokenRefresh
          .listen(Freshchat.setPushRegistrationToken);

      Freshchat.setNotificationConfig(notificationInterceptionEnabled: true);
      var notificationInterceptStream = Freshchat.onNotificationIntercept;
      notificationInterceptStream.listen((event) {
        print("Freshchat Notification Intercept detected");
        Freshchat.openFreshchatDeeplink(event["url"]);
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        var data = message.data;
        handleFreshchatNotification(data);
        print("Notification Content: $data");
      });
      FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
        "24X7 Help Center",
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
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
      children: [

        SizedBox(height: 5,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tell us how we can help ",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
           Image.asset("assets/images/hand.png",height: 20,width: 20,),
            ],
          ),
        ),
        Text(
          "Our Crew of superheroes are standing by for service & support ",
          style: GoogleFonts.poppins(
              color:  Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      SizedBox(height: 25,),
      Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color:   Colors.black26,
                offset: Offset(
                  0.5,
                  0.5,
                ), //Offset
                blurRadius:    0.5,
                spreadRadius: 0.0,
              ), //BoxShadow
            ]
        ),
     child: Column(
       children: [
         SizedBox(height: 5,),
InkWell(
  onTap: (){
    setState(() {
      Freshchat.showConversations();
    });
    // Get.toNamed(MyRouters.contuctUsScreen);
  },
  child:   Row(

    children: [

      Container(

        padding: EdgeInsets.all(12),

        decoration: BoxDecoration(

          shape: BoxShape.circle,

          color: Colors.black12

        ),

     child: SvgPicture.asset("assets/images/text.svg",width: 20,height: 20,),

      ),

      SizedBox(width: 20,),

      Column(

        mainAxisAlignment: MainAxisAlignment.start,

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text("Chat",

            style: GoogleFonts.poppins(

                color: const Color(0xFF1D1D1D),

                fontSize: 16,

                fontWeight: FontWeight.w500),),

          Text(

            "Start a conversation Now ",

            style: GoogleFonts.poppins(

                color:  Colors.grey,

                fontSize: 12,

                fontWeight: FontWeight.w500),

            textAlign: TextAlign.center,

          ),

        ],

      ),

      Spacer(),

      Icon(Icons.arrow_forward_ios_rounded)





    ],

  ),
),
         SizedBox(height: 25,),
         InkWell(
           onTap: (){
             Get.toNamed(MyRouters.fAQScreens);
           },
           child: Row(
             children: [
               Container(
                 padding: EdgeInsets.all(12),
                 decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.black12
                 ),
                 child: SvgPicture.asset("assets/images/faq.svg",width: 20,height: 20,),
               ),
               SizedBox(width: 20,),
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("FAQs",
                     style: GoogleFonts.poppins(
                         color: const Color(0xFF1D1D1D),
                         fontSize: 16,
                         fontWeight: FontWeight.w500),),
                   Text(
                     "Find intelligent answer instantly ",
                     style: GoogleFonts.poppins(
                         color:  Colors.grey,
                         fontSize: 12,
                         fontWeight: FontWeight.w500),
                     textAlign: TextAlign.center,
                   ),
                 ],
               ),
               Spacer(),
               Icon(Icons.arrow_forward_ios_rounded)


             ],
           ),
         ),
         SizedBox(height: 25,),
         InkWell(
           onTap: (){
             Get.toNamed(MyRouters.contuctUsScreen);
           },
           child: Row(
             children: [
               Container(
                 padding: EdgeInsets.all(12),
                 decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.black12
                 ),
                 child: SvgPicture.asset("assets/images/email.svg",width: 20,height: 20,),
               ),
               SizedBox(width: 20,),
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Email",
                     style: GoogleFonts.poppins(
                         color: const Color(0xFF1D1D1D),
                         fontSize: 16,
                         fontWeight: FontWeight.w500),),
                   Text(
                     "Get A solution beamed to yo ur inbox",
                     style: GoogleFonts.poppins(
                         color:  Colors.grey,
                         fontSize: 12,
                         fontWeight: FontWeight.w500),
                     textAlign: TextAlign.center,
                   ),
                 ],
               ),
               Spacer(),
               Icon(Icons.arrow_forward_ios_rounded)


             ],
           ),
         ),
         SizedBox(height: 5,),
       ],
     ),
      ),






        SizedBox(height: 15,),
      ],
      ),
    ),
    );
  }
}
