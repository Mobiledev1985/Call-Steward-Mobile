// Due to an unusual data parsing issue, unused classes and objects have been commented out.

class EmployeeDetailModel {
  EmployeeDetailModel({
    this.statusCode,
    this.statusMessage,
    this.result,
  });

  String? statusCode;
  String? statusMessage;
  Result? result;

  factory EmployeeDetailModel.fromJson(Map<String, dynamic> json) =>
      EmployeeDetailModel(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        result: Result.fromJson(json["result"]),
      );
}

class Result {
  Result({
    required this.id,
    required this.employableId,
    // required this.employableType,
    // required this.employeeListId,
    required this.employeeStatusId,
    // required this.roleId,
    // this.meta,
    required this.customField1,
    required this.customField2,
    required this.totalShifts,
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
    required this.smsNotification,
    required this.emailNotification,
    required this.appNotification,
    required this.stopNotification,
    required this.skillLock,
    // required this.isActive,
    required this.seniority,
    // required this.image,
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
    required this.availableTimes,
    // required this.attachments,
    required this.skills,
    required this.skillSeniority,
    // required this.notesDocuments,
    required this.employable,
    required this.emergencyContact,
    required this.employeeStatus,
    required this.employeeAvailability,
    // required this.notes,
  });

  String? id;
  String employableId;
  // String employableType;
  // String employeeListId;
  String? employeeStatusId;
  // String roleId;
  // dynamic meta;
  String? customField1;
  String? customField2;
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
  int? smsNotification;
  int? emailNotification;
  int? appNotification;
  int? stopNotification;
  int? skillLock;
  // int? isActive;
  String? seniority;
  // String image;
  String? dateFormat;
  String? timeFormat;
  DateTime? memberSince;
  DateTime? dateOfHire;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;
  // String pllInventory;
  // DateTime lastOffer;
  // dynamic mergeNotes;
  String? availableTimes;
  // List<dynamic> attachments;
  List<Skill> skills;
  List<SkillSeniority> skillSeniority;
  // String notesDocuments;
  Employable employable;
  List<EmergencyContact> emergencyContact;
  EmployeeStatus? employeeStatus;
  List<EmployeeAvailability>? employeeAvailability;
  // List<Note> notes;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        employableId: json["employable_id"],
        // employableType: json["employable_type"],
        // employeeListId: json["employee_list_id"],
        employeeStatusId: json["employee_status_id"],
        // roleId: json["role_id"],
        // meta: json["meta"],
        customField1: json["custom_field1"],
        customField2: json["custom_field2"],
        totalShifts: json["total_shifts"],
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
        smsNotification: json["sms_notification"],
        emailNotification: json["email_notification"],
        appNotification: json["app_notification"],
        stopNotification: json["stop_notification"],
        skillLock: json["skill_lock"],
        // isActive: json["is_active"],
        seniority: json["seniority"],
        // image: json["image"],
        dateFormat: json["date_format"],
        timeFormat: json["time_format"],
        memberSince: json["member_since"] == null
            ? null
            : DateTime.parse(json["member_since"]),
        dateOfHire: json["date_of_hire"] == null
            ? null
            : DateTime.parse(json["date_of_hire"]),
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        // pllInventory: json["pll_inventory"],
        // lastOffer: DateTime.parse(json["last_offer"]),
        // mergeNotes: json["merge_notes"],
        availableTimes: json["available_times"],
        // attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        skillSeniority: List<SkillSeniority>.from(
            json["skill_seniority"].map((x) => SkillSeniority.fromJson(x))),
        // notesDocuments: json["notes_documents"],
        employable: Employable.fromJson(json["employable"]),
        emergencyContact: List<EmergencyContact>.from(
            json["emergency_contact"].map((x) => EmergencyContact.fromJson(x))),
        employeeStatus: json["employee_status"] == null
            ? null
            : EmployeeStatus.fromJson(json["employee_status"]),
        employeeAvailability: json["employee_availability"] == null
            ? []
            : List<EmployeeAvailability>.from(json["employee_availability"]
                .map((x) => EmployeeAvailability.fromJson(x))),
        // notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
      );
}

class EmployeeAvailability {
  int? id;
  String? clientId;
  String? employeeId;
  String? createdAt;
  String? updatedAt;

  EmployeeAvailability(
      {this.id,
      this.clientId,
      this.employeeId,
      this.createdAt,
      this.updatedAt});

  EmployeeAvailability.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    employeeId = json['employee_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class EmergencyContact {
  EmergencyContact({
    required this.id,
    // required this.employeeId,
    required this.contactName,
    // required this.contactNumber,
    required this.medicalConditionsNote,
    required this.regularMedications,
    required this.homePhoneNo,
    required this.cellPhoneNo,
    required this.email,
    // required this.createdAt,
    // required this.updatedAt,
  });

  String id;
  // String employeeId;
  String? contactName;
  // String? contactNumber;
  String? medicalConditionsNote;
  String? regularMedications;
  String? homePhoneNo;
  String? cellPhoneNo;
  String? email;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      EmergencyContact(
        id: json["id"],
        // employeeId: json["employee_id"],
        contactName: json["contact_name"],
        // contactNumber: json["contact_number"],
        medicalConditionsNote: json["medical_conditions_note"],
        regularMedications: json["regular_medications"],
        homePhoneNo: json["home_phone_no"],
        cellPhoneNo: json["cell_phone_no"],
        email: json["email"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class Employable {
  Employable({
    required this.id,
    // this.activity,
    required this.displayName,
    required this.image,
    required this.email,
    // required this.emailValidated,
    required this.secondaryEmail,
    required this.driversLicense,
    required this.socialSecurity,
    required this.mothersMaidenName,
    required this.firstName,
    required this.lastName,
    // required this.rememberToken,
    // required this.roleId,
    // required this.statusId,
    required this.dob,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    // required this.deletedTimestamp,
    // this.resumeUrl,
    // required this.twoFactorAuth,
    // this.code,
    // required this.language,
    // required this.deviceToken,
    required this.addresses,
    required this.phones,
    // required this.vacations,
    // required this.nylasSubscription,
    // required this.stripeSubscription,
  });

  String id;
  // dynamic activity;
  String? displayName;
  String? image;
  String? email;
  // int emailValidated;
  String? secondaryEmail;
  String? driversLicense;
  String? socialSecurity;
  String? mothersMaidenName;
  String? firstName;
  String? lastName;
  // String? rememberToken;
  // String roleId;
  // String statusId;
  String? dob;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;
  // DateTime deletedTimestamp;
  // dynamic resumeUrl;
  // int twoFactorAuth;
  // dynamic code;
  // String language;
  // String deviceToken;
  List<Address> addresses;
  List<Phone> phones;
  // List<Vacation> vacations;
  // NylasSubscription? nylasSubscription;
  // StripeSubscription? stripeSubscription;

  factory Employable.fromJson(Map<String, dynamic> json) => Employable(
        id: json["id"],
        displayName: json["display_name"],
        image: json["image"],
        email: json["email"],
        secondaryEmail: json["secondary_email"],
        driversLicense: json["drivers_license"],
        socialSecurity: json["social_security"],
        mothersMaidenName: json["mothers_maiden_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dob: json["dob"],
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
        phones: List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
        // vacations: List<Vacation>.from(
        //     json["vacations"].map((x) => Vacation.fromJson(x))),
      );
}

class Address {
  Address({
    required this.id,
    required this.address,
    // required this.addressableId,
    // required this.addressableType,
    required this.country,
    // required this.label,
    required this.municipality,
    required this.postcode,
    required this.stateProvince,
    // required this.status,
    // required this.createdAt,
    // required this.updatedAt,
  });

  String id;
  String? address;
  // String? addressableId;
  // String? addressableType;
  String? country;
  // String? label;
  String? municipality;
  String? postcode;
  String? stateProvince;
  // int status;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        address: json["address"],
        // addressableId: json["addressable_id"],
        // addressableType: json["addressable_type"],
        country: json["country"],
        // label: json["label"],
        municipality: json["municipality"],
        postcode: json["postcode"],
        stateProvince: json["state_province"],
        // status: json["status"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class NylasSubscription {
  NylasSubscription({
    required this.id,
    required this.accountId,
    required this.userId,
    required this.calendarId,
    required this.emailAddress,
    required this.accessToken,
    required this.provider,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String accountId;
  String userId;
  String calendarId;
  String emailAddress;
  String accessToken;
  String provider;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory NylasSubscription.fromJson(Map<String, dynamic> json) =>
      NylasSubscription(
        id: json["id"],
        accountId: json["account_id"],
        userId: json["user_id"],
        calendarId: json["calendar_id"],
        emailAddress: json["email_address"],
        accessToken: json["access_token"],
        provider: json["provider"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class Phone {
  Phone({
    required this.id,
    // required this.countryCode,
    // required this.phoneableId,
    // required this.phoneableType,
    // required this.label,
    required this.phoneNumber,
    // required this.createdAt,
    // required this.updatedAt,
  });

  String id;
  // String countryCode;
  // String phoneableId;
  // String phoneableType;
  // String label;
  int? phoneNumber;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        id: json["id"],
        // countryCode: json["country_code"],
        // phoneableId: json["phoneable_id"],
        // phoneableType: json["phoneable_type"],
        // label: json["label"],
        phoneNumber: json["phone_number"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );
}

// class StripeSubscription {
//   StripeSubscription({
//     required this.id,
//     required this.userId,
//     required this.stripeSubscriptionId,
//     required this.endsAt,
//     required this.isPaid,
//     required this.allStripeData,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//   });

//   int id;
//   String userId;
//   String stripeSubscriptionId;
//   DateTime endsAt;
//   int isPaid;
//   String allStripeData;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic deletedAt;

//   factory StripeSubscription.fromJson(Map<String, dynamic> json) =>
//       StripeSubscription(
//         id: json["id"],
//         userId: json["user_id"],
//         stripeSubscriptionId: json["stripe_subscription_id"],
//         endsAt: DateTime.parse(json["ends_at"]),
//         isPaid: json["is_paid"],
//         allStripeData: json["all_stripe_data"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//       );
// }

// class Vacation {
//   Vacation({
//     required this.id,
//     required this.label,
//     required this.vacationableId,
//     required this.vacationableType,
//     required this.start,
//     required this.end,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//   });

//   String id;
//   String label;
//   String vacationableId;
//   String vacationableType;
//   DateTime start;
//   DateTime end;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic deletedAt;

//   factory Vacation.fromJson(Map<String, dynamic> json) => Vacation(
//         id: json["id"],
//         label: json["label"],
//         vacationableId: json["vacationable_id"],
//         vacationableType: json["vacationable_type"],
//         start: DateTime.parse(json["start"]),
//         end: DateTime.parse(json["end"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//       );
// }

class EmployeeStatus {
  EmployeeStatus({
//     required this.id,
//     required this.name,
//     required this.clientId,
//     required this.priority,
//     required this.ableToWork,
//     required this.ableToLogin,
    required this.ableToAccessLogs,
//     required this.blockJobNotifications,
//     required this.blockMuaBookings,
//     required this.lastOffer,
//     required this.linkColor,
//     required this.stewardsList,
//     required this.seniorityAdj,
//     this.deletedAt,
  });

//   String id;
//   String name;
//   String clientId;
//   String priority;
//   int ableToWork;
//   int ableToLogin;
  int? ableToAccessLogs;
//   int blockJobNotifications;
//   int blockMuaBookings;
//   int lastOffer;
//   String linkColor;
//   String stewardsList;
//   String seniorityAdj;
//   dynamic deletedAt;

  factory EmployeeStatus.fromJson(Map<String, dynamic> json) => EmployeeStatus(
//         id: json["id"],
//         name: json["name"],
//         clientId: json["client_id"],
//         priority: json["priority"],
//         ableToWork: json["able_to_work"],
//         ableToLogin: json["able_to_login"],
        ableToAccessLogs: json["able_to_access_logs"],
//         blockJobNotifications: json["block_job_notifications"],
//         blockMuaBookings: json["block_mua_bookings"],
//         lastOffer: json["last_offer"],
//         linkColor: json["link_color"],
//         stewardsList: json["stewards_list"],
//         seniorityAdj: json["seniority_adj"],
//         deletedAt: json["deleted_at"],
      );
}

// class Note {
//   Note({
//     required this.id,
//     this.activity,
//     required this.content,
//     required this.noteableId,
//     required this.noteableType,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//   });

//   String id;
//   String? activity;
//   String content;
//   String noteableId;
//   String noteableType;
//   DateTime createdAt;
//   DateTime updatedAt;
//   dynamic deletedAt;

//   factory Note.fromJson(Map<String, dynamic> json) => Note(
//         id: json["id"],
//         activity: json["activity"],
//         content: json["content"],
//         noteableId: json["noteable_id"],
//         noteableType: json["noteable_type"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//       );
// }

class SkillSeniority {
  SkillSeniority({
    required this.id,
    required this.employeeId,
    required this.skillId,
    this.seniority,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String employeeId;
  String skillId;
  String? seniority;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory SkillSeniority.fromJson(Map<String, dynamic> json) => SkillSeniority(
        id: json["id"],
        employeeId: json["employee_id"],
        skillId: json["skill_id"],
        seniority: json["seniority"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
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
    // required this.priotiy,
  });

  String id;
  // String? clientId;
  // String description;
  String? name;
  // int archived;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;
  // int? priotiy;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        // clientId: json["client_id"],
        // description: json["description"],
        name: json["name"],
        // archived: json["archived"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        // priotiy: json["priotiy"],
      );
}
