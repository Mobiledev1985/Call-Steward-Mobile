import 'package:get/get.dart';
// Due to an unusual data parsing issue, unused classes and objects have been commented out.

class ActionLogModel {
  String? statusCode;
  String? statusMessage;
  Result? result;

  ActionLogModel({this.statusCode, this.statusMessage, this.result});

  ActionLogModel.fromJson(Map<String, dynamic> json) {
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
  // dynamic nextPageUrl;
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
  // String? actionableType;
  // String? clientId;
  // String? initiator;
  // String? effector;
  // String? jobId;
  // String? callId;
  // String? statusId;
  // String? skillId;
  String? start;
  String? end;
  String? createdAt;
  // String? markedAt;
  // String? updatedAt;
  // dynamic deletedAt;
  Skill? skill;
  Status? status;
  User? user;
  Employee? employee;
  Job? job;

  Data(
      {this.id,
      // this.actionableType,
      // this.clientId,
      // this.initiator,
      // this.effector,
      // this.jobId,
      // this.callId,
      // this.statusId,
      // this.skillId,
      this.start,
      this.end,
      this.createdAt,
      // this.markedAt,
      // this.updatedAt,
      // this.deletedAt,
      this.skill,
      this.status,
      this.user,
      this.employee,
      this.job});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // actionableType = json['actionable_type'];
    // clientId = json['client_id'];
    // initiator = json['initiator'];
    // effector = json['effector'];
    // jobId = json['job_id'];
    // callId = json['call_id'];
    // statusId = json['status_id'];
    // skillId = json['skill_id'];
    start = json['start'];
    end = json['end'];
    createdAt = json['created_at'];
    // markedAt = json['marked_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
    skill = json['skill'] != null ? Skill.fromJson(json['skill']) : null;
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    employee =
        json['employee'] != null ? Employee.fromJson(json['employee']) : null;
    job = json['job'] != null ? Job.fromJson(json['job']) : null;
  }
}

class Skill {
  String? id;
  // String? clientId;
  // String? description;
  String? name;
  // int? archived;
  // String? createdAt;
  // String? updatedAt;
  // dynamic deletedAt;
  // int? priotiy;

  Skill({
    this.id,
    // this.clientId,
    // this.description,
    this.name,
    // this.archived,
    // this.createdAt,
    // this.updatedAt,
    // this.deletedAt,
    // this.priotiy
  });

  Skill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // clientId = json['client_id'];
    // description = json['description'];
    name = json['name'];
    // archived = json['archived'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
    // priotiy = json['priotiy'];
  }
}

class Status {
  String? id;
  // String? description;
  String? name;
  // String? statusableType;
  // String? createdAt;
  // String? updatedAt;

  Status({
    this.id,
    // this.description,
    this.name,
    // this.statusableType,
    // this.createdAt,
    // this.updatedAt
  });

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // description = json['description'];
    name = json['name'];
    // statusableType = json['statusable_type'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }
}

class User {
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
  // String? code;
  // String? language;
  // String? deviceToken;

  User({
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

  User.fromJson(Map<String, dynamic> json) {
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

class Employee {
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

  Employee(
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

  Employee.fromJson(Map<String, dynamic> json) {
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

class Job {
  String? id;
  int? jobNumber;
  // int? htsFlag;
  // int? stewardAccessFlag;
  // dynamic activity;
  // String? clientId;
  // String? employeeId;
  // String? employerId;
  // String? employerUserId;
  // String? payrollId;
  // dynamic reports;
  // String? serial;
  // String? statusId;
  String? title;
  // String? employerRequests;
  // int? employerRequestsPrivate;
  // int? employerRequestsSignin;
  // int? commentPrivate;
  // String? venueId;
  // String? createdAt;
  // String? updatedAt;
  // dynamic deletedAt;
  // String? start;
  // String? end;
  // String? payrollKey;
  // String? createdBy;
  // String? linkColor;
  // String? comment;
  // String? timeout;
  // int? disableNotify;
  // int? employerRequestFlag;
  // int? commentFlag;
  // String? skillId1;
  // String? skillId2;
  // String? skillId3;
  // String? updatedBy;
  // String? dispatchedBy;
  // int? rateId;

  Job({
    this.id,
    this.jobNumber,
    // this.htsFlag,
    // this.stewardAccessFlag,
    // this.activity,
    // this.clientId,
    // this.employeeId,
    // this.employerId,
    // this.employerUserId,
    // this.payrollId,
    // this.reports,
    // this.serial,
    // this.statusId,
    this.title,
    // this.employerRequests,
    // this.employerRequestsPrivate,
    // this.employerRequestsSignin,
    // this.commentPrivate,
    // this.venueId,
    // this.createdAt,
    // this.updatedAt,
    // this.deletedAt,
    // this.start,
    // this.end,
    // this.payrollKey,
    // this.createdBy,
    // this.linkColor,
    // this.comment,
    // this.timeout,
    // this.disableNotify,
    // this.employerRequestFlag,
    // this.commentFlag,
    // this.skillId1,
    // this.skillId2,
    // this.skillId3,
    // this.updatedBy,
    // this.dispatchedBy,
    // this.rateId
  });

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobNumber = json['job_number'];
    // htsFlag = json['hts_flag'];
    // stewardAccessFlag = json['steward_access_flag'];
    // activity = json['activity'];
    // clientId = json['client_id'];
    // employeeId = json['employee_id'];
    // employerId = json['employer_id'];
    // employerUserId = json['employer_user_id'];
    // payrollId = json['payroll_id'];
    // reports = json['reports'];
    // serial = json['serial'];
    // statusId = json['status_id'];
    title = json['title'];
    // employerRequests = json['employer_requests'];
    // employerRequestsPrivate = json['employer_requests_private'];
    // employerRequestsSignin = json['employer_requests_signin'];
    // commentPrivate = json['comment_private'];
    // venueId = json['venue_id'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
    // start = json['start'];
    // end = json['end'];
    // payrollKey = json['payroll_key'];
    // createdBy = json['created_by'];
    // linkColor = json['link_color'];
    // comment = json['comment'];
    // timeout = json['timeout'];
    // disableNotify = json['disable_notify'];
    // employerRequestFlag = json['employer_request_flag'];
    // commentFlag = json['comment_flag'];
    // skillId1 = json['skill_id1'];
    // skillId2 = json['skill_id2'];
    // skillId3 = json['skill_id3'];
    // updatedBy = json['updated_by'];
    // dispatchedBy = json['dispatched_by'];
    // rateId = json['rate_id'];
  }
}

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
// }
