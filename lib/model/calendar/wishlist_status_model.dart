import 'package:get/get.dart';

class WishlistStatusModel {
  String? statusCode;
  String? statusMessage;
  Result? result;

  WishlistStatusModel({this.statusCode, this.statusMessage, this.result});

  WishlistStatusModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class Result {
  String? id;
  // String? employeeId;
  // String? jobId;
  RxString? listType;
  // String? employeeMessage;
  // String? createdAt;
  // String? updatedAt;

  Result({
    this.id,
    // this.employeeId,
    // this.jobId,
    this.listType,
    // this.employeeMessage,
    // this.createdAt,
    // this.updatedAt
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // employeeId = json['employee_id'];
    // jobId = json['job_id'];
    listType =
        json['list_type'] == null ? RxString("") : RxString(json['list_type']);
    // employeeMessage = json['employee_message'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }
}
