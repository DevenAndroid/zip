// import 'dart:io';
// import 'dart:ui';
//
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../resources.dart';
//
//
// class ApiUrls {
//   static const String apiBaseUrl = 'https://mebel-admin.eoxyslive.com/api/';
//   static const String login = "${apiBaseUrl}login";
//   static const String signup = "${apiBaseUrl}sign-up";
//   static const String sendLoginOtp = "${apiBaseUrl}send-login-otp";
//   static const String getSpeciality = "${apiBaseUrl}get-specialities";
//   static const String pinVerify = "${apiBaseUrl}pin-verify-with-patient-details";
//   static const String getPatientAppointments = "${apiBaseUrl}get-patient-appointments";
//   static const String gethospital = "${apiBaseUrl}get-hospitals";
//   static const String geteducations = "${apiBaseUrl}get-educations";
//   static const String updatepresetstatus = "${apiBaseUrl}update-preset-status";
//   static const String getConsultation = "${apiBaseUrl}get-consultation";
//   static const String selectedConsultation = "${apiBaseUrl}get-doctor-type-of-consultation";
//   static const String GetConsultionTypeQuestiopn = "${apiBaseUrl}get-doctor-type-question?type_of_consultation_id=";
//   static const String getDoctorSetAvailavility = "${apiBaseUrl}get-doctor-hospital-avaliablity?hospital_id=";
//   static const String getPrescribeTest = "${apiBaseUrl}get-prescribe-medicines-and-tests?appointment_id=";
//   static const String GetMailQuestion = "${apiBaseUrl}get-patient-question-answer-mail?appointment_id=";
//   static const String getHospital = "${apiBaseUrl}get-doctor-hospital";
//   static const String doctordetails = "${apiBaseUrl}doctor-details";
//   static const String addDoctorQuestion = "${apiBaseUrl}add-doctor-question";
//   static const String updateSymptoms = "${apiBaseUrl}update-symptom-status";
//   static const String addSymptoms = "${apiBaseUrl}add-symptoms";
//   static const String addMedicine = "${apiBaseUrl}add-medicine";
//   static const String addMedicalTest = "${apiBaseUrl}add-medical-test";
//   static const String doctorRegistration = "${apiBaseUrl}patient-register-appointment";
//   static const String addtypeOfConsultation = "${apiBaseUrl}add-type-of-consultation";
//   static const String doctorratingsreview = "${apiBaseUrl}doctor-ratings-review";
//   static const String getDiseaseSymptom = "${apiBaseUrl}get-disease-symptom";
//   static const String appointmentavailability = "${apiBaseUrl}appointment-availability";
//   static const String appointmenttiming = "${apiBaseUrl}appointment-timing";
//   static const String getpatientprofile = "${apiBaseUrl}get-patient-profile";
//   static const String updatepatientprofile = "${apiBaseUrl}update-patient-profile";
//   static const String doctorFilters = "${apiBaseUrl}doctor-filters";
//   static const String saveAppointment = "${apiBaseUrl}save-appointment";
//   static const String upcomingAppointments = "${apiBaseUrl}upcoming-appointments";
//   static const String getDoctorTypeOfConsultation = "${apiBaseUrl}get-doctor-type-of-consultation";
//
//   static const String getDisease = "${apiBaseUrl}get-disease?appointment_id=";
//   static const String getMedicalTest = "${apiBaseUrl}get-medical-test";
//   static const String getCheckUpList = "${apiBaseUrl}get-doctor-checkup-list";
//   static const String getSymptom = "${apiBaseUrl}get-symptom";
//   static const String getNotification = "${apiBaseUrl}notification";
//   static const String getpreviousconsult = "${apiBaseUrl}get-previous-consult";
//   static const String getmedicinetaken = "${apiBaseUrl}get-medicine-taken";
//   static const String uploadReports = "${apiBaseUrl}upload-reports";
//   static const String getpatientreports = "${apiBaseUrl}get-patient-reports?patient_id=";
//   static const String deleteappointmentreport = "${apiBaseUrl}delete-appointment-report";
//   static const String deletequestionfordoctor = "${apiBaseUrl}delete-question-for-doctor";
//   static const String bloodsTestsList = "${apiBaseUrl}bloods-tests-list";
//   static const String appointmenttimeavailability = "${apiBaseUrl}appointment-time-availability";
//   static const String presetquestions = "${apiBaseUrl}preset-questions";
//   static const String presetquestionanswer = "${apiBaseUrl}preset-question-answer";
//   static const String getpresetanswer = "${apiBaseUrl}get-preset-answer";
//   static const String getDoctorProfile = "${apiBaseUrl}get-doctor-profile";
//   static const String editdoctorbio = "${apiBaseUrl}edit-doctor-bio";
//   static const String updatedoctorprofile = "${apiBaseUrl}update-doctor-profile";
//   static const String getdoctorconsulttype = "${apiBaseUrl}get-doctor-consult-type";
//   static const String getdoctorappointment = "${apiBaseUrl}get-doctor-appointment";
//   static const String getSubscriptions = "${apiBaseUrl}get-subscriptions";
//   static const String getsubscriptiondetails = "${apiBaseUrl}get-subscription-details";
//   static const String payments = "${apiBaseUrl}payment";
//   static const String appointmentDetails = "${apiBaseUrl}appointment-details";
//   static const String makeConsult = "${apiBaseUrl}make-consult";
//   static const String updateAvailability = "${apiBaseUrl}update-doctor-availability";
//   static const String getPrescribeMedicines = "${apiBaseUrl}get-prescribe-medicines";
//   static const String consultComplete = "${apiBaseUrl}consult-complete";
//   static const String generateMail = "${apiBaseUrl}generate-certificate-and-mail";
// }
//
// Future getAuthHeader() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   print(pref.getString("cookie")!.toString().replaceAll('\"', ''));
//   return {
//   HttpHeaders.contentTypeHeader: 'application/json',
//   HttpHeaders.acceptHeader: 'application/json',
//     if(pref.getString("cookie") != null)
//       HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
//   };
// }
// // HttpHeaders.contentTypeHeader: 'application/json',
// // HttpHeaders.acceptHeader: 'application/json',
// //     HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
//
// showToast(message) {
//   Fluttertoast.cancel();
//   Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: AppTheme.primaryColor,
//       textColor: Color(0xffffffff),
//       fontSize: 14);
// }