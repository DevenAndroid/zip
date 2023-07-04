import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/myprofile_model.dart';
import '../resourses/api_constant.dart';

Future<ProfileModel> myProfileRepo() async {
// var header = {
//   HttpHeaders.contentTypeHeader: "application/json",
//   HttpHeaders.acceptHeader: "application/json",
//   HttpHeaders.authorizationHeader:
//
//   " Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTgwYzYwMy1iNTk2LTQyOWItOTkzOS1jNTE3YjdlZWZiY2EiLCJqdGkiOiJmNjU0OGUyOTI4YmQ1MDVhNTMzYmFhNTAxNDMwZjg2ODNiOTQ2Njk1NjExNzNhYmY2ZTU1MThhZDhmZDc1Yzc5ZDAxYTkzYzM1ZTA5MTZiMiIsImlhdCI6MTY4ODQ1MTQ2OC45NDQ3NTIsIm5iZiI6MTY4ODQ1MTQ2OC45NDQ3NTYsImV4cCI6MTcyMDA3Mzg2OC45NDE5MTMsInN1YiI6IjE3MyIsInNjb3BlcyI6W119.m2Wn3QujvlUM2fpXI2EZJCO1FhtOcg7CLNRtdwHAsTnsjYgGVQefk6GaePlWalq4rxRyYINjTg6ztTrjnIxgObcDKC67HyxvyUNX8KycFriL7LJpiE9IfLT3mfkTcmQ8RIQOTu4dYib6q1rqVN-iwRyMgLT-0HLDpyFDfhOOJ_K_tjVWuVnKG4tCZaZ87oLjU41UiDkIgEnkYF3zpvvPoNZtq2ySLq-LSSkohMSffWjQoCvjCaWNd3W45ID5QzqSMRbO7xFouNn0jcPazdpi9RR8lQxLTIIJVzcZ2VTY0GG9KP_U7q2DV2exaz71SRa9q0cGcrtvuZ-tbVlcULzQNaDmjC7UTaIP4gnJwZvYK_1uRRjYPQYN3Knx2AYjIa4OFt8OPHMpcXEcKoJO-jNVtH8SXr2r9I7rqaAyur63zkWe5fVJLY5s0KrvO-JVg7iUBOUv4bYX6fARcr2VJymMnLrZFBj-tVhvL4IcmvaEl2859CKGBSpe-zwBedDEdziaauHV0fbq4kbTE9A51J_6mbdbGp667zXDbdhn_KlH8ZVVp7ZVQ6qnxUcR3BAhOgxXKKjTkrfVaY30xYCbCjQt"};
  try {
    print(await getAuthHeader());
    http.Response response =
    await http.get(Uri.parse(ApiUrls.myProfile), headers:await getAuthHeader());
    print(response.statusCode);
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  } catch (e) {
    throw Exception(e);
  }
}