import 'package:get/get.dart';
// Due to an unusual data parsing issue, unused classes and objects have been commented out.

class NotifyLogModel {
  String? statusCode;
  String? statusMessage;
  Result? result;

  NotifyLogModel({this.statusCode, this.statusMessage, this.result});

  NotifyLogModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class Result {
  int? currentPage;
  RxList<Data>? data;
  // String? firstPageUrl;
  // int? from;
  int? lastPage;
  // String? lastPageUrl;
  // List<Links>? links;
  // String? nextPageUrl;
  // String? path;
  // int? perPage;
  // dynamic prevPageUrl;
  // int? to;
  // int? total;

  Result({
    this.currentPage,
    this.data,
    // this.firstPageUrl,
    // this.from,
    this.lastPage,
    // this.lastPageUrl,
    // this.links,
    // this.nextPageUrl,
    // this.path,
    // this.perPage,
    // this.prevPageUrl,
    // this.to,
    // this.total
  });

  Result.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[].obs;
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    // firstPageUrl = json['first_page_url'];
    // from = json['from'];
    lastPage = json['last_page'];
    // lastPageUrl = json['last_page_url'];
    // if (json['links'] != null) {
    //   links = <Links>[];
    //   json['links'].forEach((v) {
    //     links!.add(Links.fromJson(v));
    //   });
    // }
    // nextPageUrl = json['next_page_url'];
    // path = json['path'];
    // perPage = json['per_page'];
    // prevPageUrl = json['prev_page_url'];
    // to = json['to'];
    // total = json['total'];
  }
}

class Data {
  String? id;
  int? messageId;
  // String? subject;
  // String? notifiableId;
  // String? initiator;
  // String? notifiableType;
  // String? clientId;
  // String? jobId;
  // String? activity;
  String? type;
  String? body;
  String? smsId;
  String? status;
  int? notifiedFailedSms;
  String? createdAt;
  // String? updatedAt;
  Notifiable? notifiable;
  // User? user;

  Data({
    this.id,
    this.messageId,
    // this.subject,
    // this.notifiableId,
    // this.initiator,
    // this.notifiableType,
    // this.clientId,
    // this.jobId,
    // this.activity,
    this.type,
    this.body,
    this.smsId,
    this.status,
    this.notifiedFailedSms,
    this.createdAt,
    // this.updatedAt,
    this.notifiable,
    // this.user
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    messageId = json['message_id'];
    // subject = json['subject'];
    // notifiableId = json['notifiable_id'];
    // initiator = json['initiator'];
    // notifiableType = json['notifiable_type'];
    // clientId = json['client_id'];
    // jobId = json['job_id'];
    // activity = json['activity'];
    type = json['type'];
    body = json['body'];
    smsId = json['sms_id'];
    status = json['status'];
    notifiedFailedSms = json['notified_failed_sms'];
    createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    notifiable = json['notifiable'] != null
        ? Notifiable.fromJson(json['notifiable'])
        : null;
    // user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class Notifiable {
  String? id;
  // dynamic activity;
  // String? employableId;
  // String? employableType;
  // String? employeeListId;
  // String? employeeStatusId;
  // String? roleId;
  // dynamic meta;
  // String? customField1;
  // String? customField2;
  // int? totalShifts;
  // int? totalShiftWeekly;
  // int? totalShiftYTD;
  // int? shiftYTDLastYear;
  // int? totalShiftJulyJune;
  // int? totalDecline;
  // int? totalDeclineWeekly;
  // int? totalDeclineYTD;
  // int? declineYTDLastYear;
  // int? totalDeclineJulyJune;
  // int? isMember;
  // int? smsNotification;
  // int? emailNotification;
  // int? appNotification;
  // int? stopNotification;
  // int? skillLock;
  // int? isActive;
  // String? seniority;
  // String? image;
  // String? dateFormat;
  // String? timeFormat;
  // String? memberSince;
  // String? dateOfHire;
  // String? createdAt;
  // String? updatedAt;
  // dynamic deletedAt;
  // String? pllInventory;
  // String? lastOffer;
  // dynamic mergeNotes;
  Employable? employable;

  Notifiable(
      {this.id,
      // this.activity,
      // this.employableId,
      // this.employableType,
      // this.employeeListId,
      // this.employeeStatusId,
      // this.roleId,
      // this.meta,
      // this.customField1,
      // this.customField2,
      // this.totalShifts,
      // this.totalShiftWeekly,
      // this.totalShiftYTD,
      // this.shiftYTDLastYear,
      // this.totalShiftJulyJune,
      // this.totalDecline,
      // this.totalDeclineWeekly,
      // this.totalDeclineYTD,
      // this.declineYTDLastYear,
      // this.totalDeclineJulyJune,
      // this.isMember,
      // this.smsNotification,
      // this.emailNotification,
      // this.appNotification,
      // this.stopNotification,
      // this.skillLock,
      // this.isActive,
      // this.seniority,
      // this.image,
      // this.dateFormat,
      // this.timeFormat,
      // this.memberSince,
      // this.dateOfHire,
      // this.createdAt,
      // this.updatedAt,
      // this.deletedAt,
      // this.pllInventory,
      // this.lastOffer,
      // this.mergeNotes,
      this.employable});

  Notifiable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // activity = json['activity'];
    // employableId = json['employable_id'];
    // employableType = json['employable_type'];
    // employeeListId = json['employee_list_id'];
    // employeeStatusId = json['employee_status_id'];
    // roleId = json['role_id'];
    // meta = json['meta'];
    // customField1 = json['custom_field1'];
    // customField2 = json['custom_field2'];
    // totalShifts = json['total_shifts'];
    // totalShiftWeekly = json['total_shift_weekly'];
    // totalShiftYTD = json['total_shift_YTD'];
    // shiftYTDLastYear = json['shift_YTD_last_year'];
    // totalShiftJulyJune = json['total_shift_july_june'];
    // totalDecline = json['total_decline'];
    // totalDeclineWeekly = json['total_decline_weekly'];
    // totalDeclineYTD = json['total_decline_YTD'];
    // declineYTDLastYear = json['decline_YTD_last_year'];
    // totalDeclineJulyJune = json['total_decline_july_june'];
    // isMember = json['is_member'];
    // smsNotification = json['sms_notification'];
    // emailNotification = json['email_notification'];
    // appNotification = json['app_notification'];
    // stopNotification = json['stop_notification'];
    // skillLock = json['skill_lock'];
    // isActive = json['is_active'];
    // seniority = json['seniority'];
    // image = json['image'];
    // dateFormat = json['date_format'];
    // timeFormat = json['time_format'];
    // memberSince = json['member_since'];
    // dateOfHire = json['date_of_hire'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
    // pllInventory = json['pll_inventory'];
    // lastOffer = json['last_offer'];
    // mergeNotes = json['merge_notes'];
    employable = json['employable'] != null
        ? Employable.fromJson(json['employable'])
        : null;
  }
}

class Employable {
  String? id;
  // dynamic activity;
  // String? displayName;
  // String? image;
  // String? email;
  // int? emailValidated;
  // String? secondaryEmail;
  // String? driversLicense;
  // String? socialSecurity;
  // String? mothersMaidenName;
  String? firstName;
  String? lastName;
  // String? rememberToken;
  // String? roleId;
  // String? statusId;
  // String? dob;
  // String? createdAt;
  // String? updatedAt;
  // dynamic deletedAt;
  // String? deletedTimestamp;
  // dynamic resumeUrl;
  // int? twoFactorAuth;
  // dynamic code;
  // String? language;
  // String? deviceToken;

  Employable({
    this.id,
    // this.activity,
    // this.displayName,
    // this.image,
    // this.email,
    // this.emailValidated,
    // this.secondaryEmail,
    // this.driversLicense,
    // this.socialSecurity,
    // this.mothersMaidenName,
    this.firstName,
    this.lastName,
    // this.rememberToken,
    // this.roleId,
    // this.statusId,
    // this.dob,
    // this.createdAt,
    // this.updatedAt,
    // this.deletedAt,
    // this.deletedTimestamp,
    // this.resumeUrl,
    // this.twoFactorAuth,
    // this.code,
    // this.language,
    // this.deviceToken
  });

  Employable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // activity = json['activity'];
    // displayName = json['display_name'];
    // image = json['image'];
    // email = json['email'];
    // emailValidated = json['email_validated'];
    // secondaryEmail = json['secondary_email'];
    // driversLicense = json['drivers_license'];
    // socialSecurity = json['social_security'];
    // mothersMaidenName = json['mothers_maiden_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    // rememberToken = json['remember_token'];
    // roleId = json['role_id'];
    // statusId = json['status_id'];
    // dob = json['dob'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
    // deletedTimestamp = json['deleted_timestamp'];
    // resumeUrl = json['resume_url'];
    // twoFactorAuth = json['two_factor_auth'];
    // code = json['code'];
    // language = json['language'];
    // deviceToken = json['device_token'];
  }
}

// class User {
//   String? id;
//   dynamic activity;
//   String? displayName;
//   String? image;
//   String? email;
//   int? emailValidated;
//   String? secondaryEmail;
//   String? driversLicense;
//   String? socialSecurity;
//   String? mothersMaidenName;
//   String? firstName;
//   String? lastName;
//   String? rememberToken;
//   String? roleId;
//   String? statusId;
//   String? dob;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;
//   String? deletedTimestamp;
//   dynamic resumeUrl;
//   int? twoFactorAuth;
//   String? code;
//   String? language;
//   String? deviceToken;

//   User(
//       {this.id,
//       this.activity,
//       this.displayName,
//       this.image,
//       this.email,
//       this.emailValidated,
//       this.secondaryEmail,
//       this.driversLicense,
//       this.socialSecurity,
//       this.mothersMaidenName,
//       this.firstName,
//       this.lastName,
//       this.rememberToken,
//       this.roleId,
//       this.statusId,
//       this.dob,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt,
//       this.deletedTimestamp,
//       this.resumeUrl,
//       this.twoFactorAuth,
//       this.code,
//       this.language,
//       this.deviceToken});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     activity = json['activity'];
//     displayName = json['display_name'];
//     image = json['image'];
//     email = json['email'];
//     emailValidated = json['email_validated'];
//     secondaryEmail = json['secondary_email'];
//     driversLicense = json['drivers_license'];
//     socialSecurity = json['social_security'];
//     mothersMaidenName = json['mothers_maiden_name'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     rememberToken = json['remember_token'];
//     roleId = json['role_id'];
//     statusId = json['status_id'];
//     dob = json['dob'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     deletedTimestamp = json['deleted_timestamp'];
//     resumeUrl = json['resume_url'];
//     twoFactorAuth = json['two_factor_auth'];
//     code = json['code'];
//     language = json['language'];
//     deviceToken = json['device_token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['activity'] = activity;
//     data['display_name'] = displayName;
//     data['image'] = image;
//     data['email'] = email;
//     data['email_validated'] = emailValidated;
//     data['secondary_email'] = secondaryEmail;
//     data['drivers_license'] = driversLicense;
//     data['social_security'] = socialSecurity;
//     data['mothers_maiden_name'] = mothersMaidenName;
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['remember_token'] = rememberToken;
//     data['role_id'] = roleId;
//     data['status_id'] = statusId;
//     data['dob'] = dob;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     data['deleted_timestamp'] = deletedTimestamp;
//     data['resume_url'] = resumeUrl;
//     data['two_factor_auth'] = twoFactorAuth;
//     data['code'] = code;
//     data['language'] = language;
//     data['device_token'] = deviceToken;
//     return data;
//   }
// }

// class Links {
//   String? url;
//   String? label;
//   bool? active;

//   Links({this.url, this.label, this.active});

//   Links.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['url'] = url;
//     data['label'] = label;
//     data['active'] = active;
//     return data;
//   }
// }
