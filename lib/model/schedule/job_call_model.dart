// Due to an unusual data parsing issue, unused classes and objects have been commented out.

class JobCallModel {
  JobCallModel({
    required this.id,
    // this.activity,
    // required this.employeeId,
    required this.jobId,
    // this.offers,
    required this.rate,
    required this.isRateAvailable,
    // this.responseToken,
    required this.confirmBy,
    // required this.statusId,
    // this.attendanceStatusId,
    // required this.calledAt,
    required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    required this.end,
    required this.start,
    this.markedAt,
    this.notifiedAt,
    // required this.assignedAt,
    required this.notes,
    // required this.splitFlag,
    required this.job,
    required this.status,
    required this.skill,
    required this.employee,
    required this.muaBookingConflict,
  });

  String? id;
  // dynamic activity;
  // String? employeeId;
  String? jobId;
  // dynamic offers;
  num? rate;
  bool isRateAvailable;
  // dynamic responseToken;
  String? confirmBy;
  // String? statusId;
  // dynamic attendanceStatusId;
  // DateTime? calledAt;
  DateTime? createdAt;
  // DateTime? updatedAt;
  // dynamic deletedAt;
  DateTime? end;
  DateTime? start;
  String? markedAt;
  String? notifiedAt;
  // DateTime? assignedAt;
  String? notes;
  // int? splitFlag;
  Job? job;
  Status? status;
  Skill? skill;
  Employee? employee;
  List<String> muaBookingConflict;

  factory JobCallModel.fromJson(Map<String, dynamic> json) => JobCallModel(
        id: json["id"],
        // activity: json["activity"],
        // employeeId: json["employee_id"],
        jobId: json["job_id"],
        // offers: json["offers"],
        rate: json["rate"],
        isRateAvailable: json.containsKey('rate'),
        // responseToken: json["response_token"],
        confirmBy: json["confirmed_by"],
        // statusId: json["status_id"],
        // attendanceStatusId: json["attendance_status_id"],
        // calledAt: json["called_at"] == null
        //     ? null
        //     : DateTime.parse(json["called_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        // updatedAt: json["updated_at"] == null
        //     ? null
        //     : DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        markedAt: json["marked_at"],
        notifiedAt: json["notified_at"],
        // assignedAt: json["assigned_at"] == null
        //     ? null
        //     : DateTime.parse(json["assigned_at"]),
        notes: json["notes"],
        // splitFlag: json["split_flag"],
        job: json["job"] == null ? null : Job.fromJson(json["job"]),
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        skill: json["skill"] == null ? null : Skill.fromJson(json["skill"]),
        employee: json["employee"] == null
            ? null
            : Employee.fromJson(json["employee"]),
        muaBookingConflict: json["mua_booking_conflict"] == null
            ? []
            : (json["mua_booking_conflict"] as List).isEmpty
                ? []
                : List<String>.from(json["mua_booking_conflict"].map((x) => x)),
      );
}

class Employee {
  Employee({
    required this.id,
    // this.activity,
    // required this.employableId,
    // required this.employableType,
    // required this.employeeListId,
    // required this.employeeStatusId,
    // required this.roleId,
    // this.meta,
    // required this.customField1,
    // required this.customField2,
    // required this.totalShifts,
    // required this.totalShiftWeekly,
    // required this.totalShiftYtd,
    // required this.shiftYtdLastYear,
    // required this.totalShiftJulyJune,
    // required this.totalDecline,
    // required this.totalDeclineWeekly,
    // required this.totalDeclineYtd,
    // required this.declineYtdLastYear,
    // required this.totalDeclineJulyJune,
    // required this.isMember,
    // required this.smsNotification,
    // required this.emailNotification,
    // required this.appNotification,
    // required this.stopNotification,
    // required this.skillLock,
    // required this.isActive,
    this.seniority,
    required this.image,
    required this.dateFormat,
    required this.timeFormat,
    required this.memberSince,
    required this.dateOfHire,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    // required this.pllInventory,
    // required this.lastOffer,
    // this.mergeNotes,
    required this.employable,
  });

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
  int? totalShifts;
  // int? totalShiftWeekly;
  // int? totalShiftYtd;
  // int? shiftYtdLastYear;
  // int? totalShiftJulyJune;
  // int? totalDecline;
  // int? totalDeclineWeekly;
  // int? totalDeclineYtd;
  // int? declineYtdLastYear;
  // int? totalDeclineJulyJune;
  // int? isMember;
  // int? smsNotification;
  // int? emailNotification;
  // int? appNotification;
  // int? stopNotification;
  // int? skillLock;
  // int? isActive;
  String? seniority;
  String? image;
  String? dateFormat;
  String? timeFormat;
  DateTime? memberSince;
  DateTime? dateOfHire;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // dynamic deletedAt;
  // String? pllInventory;
  // DateTime? lastOffer;
  // dynamic mergeNotes;
  Employable? employable;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        // activity: json["activity"],
        // employableId: json["employable_id"],
        // employableType: json["employable_type"],
        // employeeListId: json["employee_list_id"],
        // employeeStatusId: json["employee_status_id"],
        // roleId: json["role_id"],
        // meta: json["meta"],
        // customField1: json["custom_field1"],
        // customField2: json["custom_field2"],
        // totalShifts: json["total_shifts"],
        // totalShiftWeekly: json["total_shift_weekly"],
        // totalShiftYtd: json["total_shift_YTD"],
        // shiftYtdLastYear: json["shift_YTD_last_year"],
        // totalShiftJulyJune: json["total_shift_july_june"],
        // totalDecline: json["total_decline"],
        // totalDeclineWeekly: json["total_decline_weekly"],
        // totalDeclineYtd: json["total_decline_YTD"],
        // declineYtdLastYear: json["decline_YTD_last_year"],
        // totalDeclineJulyJune: json["total_decline_july_june"],
        // isMember: json["is_member"],
        // smsNotification: json["sms_notification"],
        // emailNotification: json["email_notification"],
        // appNotification: json["app_notification"],
        // stopNotification: json["stop_notification"],
        // skillLock: json["skill_lock"],
        // isActive: json["is_active"],
        seniority: json["seniority"],
        image: json["image"],
        dateFormat: json["date_format"],
        timeFormat: json["time_format"],
        memberSince: json["member_since"] == null
            ? null
            : DateTime.parse(json["member_since"]),
        dateOfHire: json["date_of_hire"] == null
            ? null
            : DateTime.parse(json["date_of_hire"]),
        // createdAt: json["created_at"] == null
        //     ? null
        //     : DateTime.parse(json["created_at"]),
        // updatedAt: json["updated_at"] == null
        //     ? null
        //     : DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        // pllInventory: json["pll_inventory"],
        // lastOffer: json["last_offer"] == null
        //     ? null
        //     : DateTime.parse(json["last_offer"]),
        // mergeNotes: json["merge_notes"],
        employable: json["employable"] == null
            ? null
            : Employable.fromJson(json["employable"]),
      );
}

class Employable {
  Employable({
    // required this.id,
    // this.activity,
    // required this.displayName,
    // required this.image,
    // required this.email,
    // required this.emailValidated,
    // required this.secondaryEmail,
    // required this.driversLicense,
    // required this.socialSecurity,
    // required this.mothersMaidenName,
    required this.firstName,
    required this.lastName,
    // required this.rememberToken,
    // required this.roleId,
    // required this.statusId,
    // this.dob,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    // required this.deletedTimestamp,
    // this.resumeUrl,
    // required this.twoFactorAuth,
    // this.code,
    // required this.language,
    // this.deviceToken,
  });

  // String? id;
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
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // dynamic deletedAt;
  // DateTime? deletedTimestamp;
  // dynamic resumeUrl;
  // int? twoFactorAuth;
  // String? code;
  // String? language;
  // String? deviceToken;

  factory Employable.fromJson(Map<String, dynamic> json) => Employable(
        // id: json["id"],
        // activity: json["activity"],
        // displayName: json["display_name"],
        // image: json["image"],
        // email: json["email"],
        // emailValidated: json["email_validated"],
        // secondaryEmail: json["secondary_email"],
        // driversLicense: json["drivers_license"],
        // socialSecurity: json["social_security"],
        // mothersMaidenName: json["mothers_maiden_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        // rememberToken: json["remember_token"],
        // roleId: json["role_id"],
        // statusId: json["status_id"],
        // dob: json["dob"],
        // createdAt: json["created_at"] == null
        //     ? null
        //     : DateTime.parse(json["created_at"]),
        // updatedAt: json["updated_at"] == null
        //     ? null
        //     : DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        // deletedTimestamp: json["deleted_timestamp"] == null
        //     ? null
        //     : DateTime.parse(json["deleted_timestamp"]),
        // resumeUrl: json["resume_url"],
        // twoFactorAuth: json["two_factor_auth"],
        // code: json["code"],
        // language: json["language"],
        // deviceToken: json["device_token"],
      );
}

class Job {
  Job({
    required this.id,
    // required this.jobNumber,
    // required this.htsFlag,
    // required this.stewardAccessFlag,
    // this.activity,
    // required this.clientId,
    // required this.employeeId,
    // required this.employerId,
    // required this.employerUserId,
    // required this.payrollId,
    // this.reports,
    // required this.serial,
    // required this.statusId,
    required this.title,
    required this.employerRequests,
    // required this.employerRequestsPrivate,
    // required this.employerRequestsSignin,
    // required this.commentPrivate,
    // required this.venueId,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    required this.start,
    required this.end,
    // required this.payrollKey,
    // required this.createdBy,
    // required this.linkColor,
    required this.comment,
    // required this.timeout,
    // required this.disableNotify,
    // required this.employerRequestFlag,
    // required this.commentFlag,
    // required this.skillId1,
    // required this.skillId2,
    // required this.skillId3,
    // required this.updatedBy,
    // required this.dispatchedBy,
    // required this.rateId,
    required this.employer,
    required this.employee,
    required this.client,
    // required this.hw,
    // required this.report,
    // required this.notes,
    required this.venue,
  });

  String? id;
  // int? jobNumber;
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
  String? employerRequests;
  // int? employerRequestsPrivate;
  // int? employerRequestsSignin;
  // int? commentPrivate;
  // String? venueId;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // dynamic deletedAt;
  DateTime? start;
  DateTime? end;
  // String? payrollKey;
  // String? createdBy;
  // String? linkColor;
  String? comment;
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
  Employer? employer;
  Employee? employee;
  Client? client;
  // List<dynamic> hw;
  // List<dynamic> report;
  // List<dynamic> notes;
  Venue? venue;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        // jobNumber: json["job_number"],
        // htsFlag: json["hts_flag"],
        // stewardAccessFlag: json["steward_access_flag"],
        // activity: json["activity"],
        // clientId: json["client_id"],
        // employeeId: json["employee_id"],
        // employerId: json["employer_id"],
        // employerUserId: json["employer_user_id"],
        // payrollId: json["payroll_id"],
        // reports: json["reports"],
        // serial: json["serial"],
        // statusId: json["status_id"],
        title: json["title"],
        employerRequests: json["employer_requests"],
        // employerRequestsPrivate: json["employer_requests_private"],
        // employerRequestsSignin: json["employer_requests_signin"],
        // commentPrivate: json["comment_private"],
        // venueId: json["venue_id"],
        // createdAt: json["created_at"] == null
        //     ? null
        //     : DateTime.parse(json["created_at"]),
        // updatedAt: json["updated_at"] == null
        //     ? null
        //     : DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        // payrollKey: json["payroll_key"],
        // createdBy: json["created_by"],
        // linkColor: json["link_color"],
        comment: json["comment"],
        // timeout: json["timeout"],
        // disableNotify: json["disable_notify"],
        // employerRequestFlag: json["employer_request_flag"],
        // commentFlag: json["comment_flag"],
        // skillId1: json["skill_id1"],
        // skillId2: json["skill_id2"],
        // skillId3: json["skill_id3"],
        // updatedBy: json["updated_by"],
        // dispatchedBy: json["dispatched_by"],
        // rateId: json["rate_id"],
        employer: json["employer"] == null
            ? null
            : Employer.fromJson(json["employer"]),
        employee: json["employee"] == null
            ? null
            : Employee.fromJson(json["employee"]),
        client: json["client"] == null ? null : Client.fromJson(json['client']),
        // hw: List<dynamic>.from(json["hw"].map((x) => x)),
        // report: List<dynamic>.from(json["report"].map((x) => x)),
        // notes: List<dynamic>.from(json["notes"].map((x) => x)),
        venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
      );
}

class Employer {
  Employer({
    required this.id,
    required this.name,
    // required this.email,
    // required this.image,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    required this.employerUsers,
  });

  String? id;
  String? name;
  // String? email;
  // String? image;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // dynamic deletedAt;
  List<EmployerUser> employerUsers;

  factory Employer.fromJson(Map<String, dynamic> json) => Employer(
        id: json["id"],
        name: json["name"],
        // email: json["email"],
        // image: json["image"],
        // createdAt: json["created_at"] == null
        //     ? null
        //     : DateTime.parse(json["created_at"]),
        // updatedAt: json["updated_at"] == null
        //     ? null
        //     : DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        employerUsers: List<EmployerUser>.from(
            json["employer_users"].map((x) => EmployerUser.fromJson(x))),
      );
}

class Client {
  String? subdomain;
  String? contactPerson;

  Client({this.subdomain, this.contactPerson});

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        subdomain: json['subdomain'],
        contactPerson: json['contact_person'],
      );
}

class EmployerUser {
  EmployerUser({
    required this.id,
    // required this.userId,
    // required this.employerId,
    // required this.roleId,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    required this.user,
  });

  String? id;
  // String? userId;
  // String? employerId;
  // String? roleId;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // dynamic deletedAt;
  Employable user;

  factory EmployerUser.fromJson(Map<String, dynamic> json) => EmployerUser(
        id: json["id"],
        // userId: json["user_id"],
        // employerId: json["employer_id"],
        // roleId: json["role_id"],
        // createdAt: json["created_at"] == null
        //     ? null
        //     : DateTime.parse(json["created_at"]),
        // updatedAt: json["updated_at"] == null
        //     ? null
        //     : DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        user: Employable.fromJson(json["user"]),
      );
}

class Venue {
  Venue({
    required this.id,
    // required this.clientId,
    required this.name,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    required this.addresses,
  });

  String? id;
  // String? clientId;
  String? name;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // dynamic deletedAt;
  List<Address> addresses;

  factory Venue.fromJson(Map<String?, dynamic> json) => Venue(
        id: json["id"],
        // clientId: json["client_id"],
        name: json["name"],
        // createdAt: json["created_at"] == null
        //     ? null
        //     : DateTime.parse(json["created_at"]),
        // updatedAt: json["updated_at"] == null
        //     ? null
        //     : DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        addresses: json["addresses"] == null
            ? []
            : List<Address>.from(
                json["addresses"].map((x) => Address.fromJson(x))),
      );
}

class Address {
  Address({
    required this.id,
    required this.address,
    // required this.addressableId,
    // required this.addressableType,
    required this.country,
    // this.label,
    required this.municipality,
    required this.postcode,
    required this.stateProvince,
    // this.status,
    // required this.createdAt,
    // required this.updatedAt,
  });

  String? id;
  String? address;
  // String addressableId;
  // String addressableType;
  String? country;
  // dynamic label;
  String? municipality;
  String? postcode;
  String? stateProvince;
  // int? status;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] as String,
        address: json["address"] as String,
        // addressableId: json["addressable_id"] as String,
        // addressableType: json["addressable_type"] as String,
        country: json["country"] as String,
        // label: json["label"],
        municipality: json["municipality"] as String,
        postcode: json["postcode"] as String,
        stateProvince: json["state_province"] as String,
        // status: json["status"] as int?,
        // createdAt: DateTime.parse(json["created_at"] as String),
        // updatedAt: DateTime.parse(json["updated_at"] as String),
      );
}

class Skill {
  Skill({
    required this.id,
    // required this.clientId,
    // required this.description,
    required this.name,
    // required this.archived,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    // required this.priority,
  });

  String? id;
  // String? clientId;
  // String? description;
  String? name;
  // int? archived;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // dynamic deletedAt;
  // int? priority;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"] as String?,
        // clientId: json["client_id"] as String?,
        // description: json["description"] as String?,
        name: json["name"] as String?,
        // archived: json["archived"] as int?,
        // createdAt: DateTime.parse(json["created_at"] as String? ?? ''),
        // updatedAt: DateTime.parse(json["updated_at"] as String? ?? ''),
        // deletedAt: json["deleted_at"],
        // priority: json["priority"] as int?,
      );
}

class Status {
  Status({
    this.id,
    // this.description,
    this.name,
    // this.statusableType,
    // this.createdAt,
    // this.updatedAt,
  });

  String? id;
  // String? description;
  String? name;
  // String? statusableType;
  // DateTime? createdAt;
  // DateTime? updatedAt;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"] as String?,
        // description: json["description"] as String?,
        name: json["name"] as String?,
        // statusableType: json["statusable_type"] as String?,
        // createdAt: DateTime.tryParse(json["created_at"] as String? ?? ''),
        // updatedAt: DateTime.tryParse(json["updated_at"] as String? ?? ''),
      );
}
