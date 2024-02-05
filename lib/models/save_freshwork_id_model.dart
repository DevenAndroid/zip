class SaveFreshworkModel {
  bool? status;
  String? message;

  SaveFreshworkModel({this.status, this.message});

  SaveFreshworkModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
