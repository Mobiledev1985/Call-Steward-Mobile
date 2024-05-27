// Due to an unusual data parsing issue, unused classes and objects have been commented out.

class CalendarJobModel {
  String? id;
  // int? jobNumber;
  // int? htsFlag;
  // int? stewardAccessFlag;
  // String? clientId;
  // String? employeeId;
  // String? employerId;
  // String? employerUserId;
  // String? payrollId;
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
  String? start;
  String? end;
  // String? payrollKey;
  // String? createdBy;
  String? linkColor;
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
  // String? firstName;
  // String? lastName;
  // int? callsCount;
  // int? unassignedCallsCount;
  // int? unconfirmedCallsCount;
  // int? confirmedCallsCount;
  // int? issues;
  // Client? client;
  // Venue? venue;
  // Employee? employee;
  // Employer? employer;
  // dynamic payroll;
  // Status? status;
  // List<Notes>? notes;

  CalendarJobModel({
    this.id,
    // this.jobNumber,
    // this.htsFlag,
    // this.stewardAccessFlag,
    // this.clientId,
    // this.employeeId,
    // this.employerId,
    // this.employerUserId,
    // this.payrollId,
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
    this.start,
    this.end,
    // this.payrollKey,
    // this.createdBy,
    this.linkColor,
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
    // this.rateId,
    // this.firstName,
    // this.lastName,
    // this.callsCount,
    // this.unassignedCallsCount,
    // this.unconfirmedCallsCount,
    // this.confirmedCallsCount,
    // this.issues,
    // this.client,
    // this.venue,
    // this.employee,
    // this.employer,
    // this.payroll,
    // this.status,
    // this.notes,
  });

  CalendarJobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // jobNumber = json['job_number'];
    // htsFlag = json['hts_flag'];
    // stewardAccessFlag = json['steward_access_flag'];
    // clientId = json['client_id'];
    // employeeId = json['employee_id'];
    // employerId = json['employer_id'];
    // employerUserId = json['employer_user_id'];
    // payrollId = json['payroll_id'];
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
    start = json['start'];
    end = json['end'];
    // payrollKey = json['payroll_key'];
    // createdBy = json['created_by'];
    linkColor = json['link_color'];
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
    // firstName = json['first_name'];
    // lastName = json['last_name'];
    // callsCount = json['calls_count'];
    // unassignedCallsCount = json['unassigned_calls_count'];
    // unconfirmedCallsCount = json['unconfirmed_calls_count'];
    // confirmedCallsCount = json['confirmed_calls_count'];
    // issues = json['issues'];
    // client = json['client'] != null ? Client.fromJson(json['client']) : null;
    // venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    // employee =
    //     json['employee'] != null ? Employee.fromJson(json['employee']) : null;
    // employer =
    //     json['employer'] != null ? Employer.fromJson(json['employer']) : null;
    // payroll = json['payroll'];
    // status = json['status'] != null ? Status.fromJson(json['status']) : null;

    // if (json['notes'] != null) {
    //   notes = <Notes>[];
    //   json['notes'].forEach((v) {
    //     notes!.add(Notes.fromJson(v));
    //   });
    // }
  }
}

// class Client {
//   String? id;
//   String? note;
//   String? country;
//   String? subdomain;
//   String? contactPerson;
//   String? contactPhone;
//   String? contactEmail;
//   String? timezone;
//   String? userId;
//   int? maxUser;
//   String? employeeSettings;
//   int? isActive;
//   int? displayLogoHeader;
//   int? pageBreakdown;
//   String? sortCallConfiguration;
//   int? internetConfirm;
//   int? passOption;
//   int? reports;
//   int? employeeTitle;
//   int? callAssignmentTitle;
//   int? callSheetTitle;
//   int? hideEmptyDays;
//   int? ignoreDecline;
//   int? skillLock;
//   int? wishlistLock;
//   int? ignorelistLock;
//   String? createdAt;
//   String? updatedAt;
//   String? billingContact;
//   String? billingPhone;
//   String? billingEmail;
//   String? logo;
//   String? loginImage;
//   String? defaultSort;
//   String? defaultEmployeeSort;
//   String? defaultCallSort;
//   String? defaultPhonesheetSort;
//   String? loginPageMessage;
//   String? turnover;
//   String? phonesheetTs;
//   String? customField1;
//   String? customField2;
//   int? viewSwitch;
//   String? customCallClearMssg;
//   String? customCallEditMssg;
//   String? currency;
//   String? widgetTags;
//   String? gcsSigninSheetTemplate;
//   String? gcsSigninSheetData;
//   String? assignPageDefaultStatus;
//   int? powerSteward;
//   int? globalSkills;
//   String? notifyTemplates;
//   int? batchNotifyFlag;
//   int? mailingListVisibilityFlag;
//   int? estimatePayrollButton;
//   String? supportSiteUrl;

//   Client(
//       {this.id,
//       this.note,
//       this.country,
//       this.subdomain,
//       this.contactPerson,
//       this.contactPhone,
//       this.contactEmail,
//       this.timezone,
//       this.userId,
//       this.maxUser,
//       this.employeeSettings,
//       this.isActive,
//       this.displayLogoHeader,
//       this.pageBreakdown,
//       this.sortCallConfiguration,
//       this.internetConfirm,
//       this.passOption,
//       this.reports,
//       this.employeeTitle,
//       this.callAssignmentTitle,
//       this.callSheetTitle,
//       this.hideEmptyDays,
//       this.ignoreDecline,
//       this.skillLock,
//       this.wishlistLock,
//       this.ignorelistLock,
//       this.createdAt,
//       this.updatedAt,
//       this.billingContact,
//       this.billingPhone,
//       this.billingEmail,
//       this.logo,
//       this.loginImage,
//       this.defaultSort,
//       this.defaultEmployeeSort,
//       this.defaultCallSort,
//       this.defaultPhonesheetSort,
//       this.loginPageMessage,
//       this.turnover,
//       this.phonesheetTs,
//       this.customField1,
//       this.customField2,
//       this.viewSwitch,
//       this.customCallClearMssg,
//       this.customCallEditMssg,
//       this.currency,
//       this.widgetTags,
//       this.gcsSigninSheetTemplate,
//       this.gcsSigninSheetData,
//       this.assignPageDefaultStatus,
//       this.powerSteward,
//       this.globalSkills,
//       this.notifyTemplates,
//       this.batchNotifyFlag,
//       this.mailingListVisibilityFlag,
//       this.estimatePayrollButton,
//       this.supportSiteUrl});

//   Client.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     note = json['note'];
//     country = json['country'];
//     subdomain = json['subdomain'];
//     contactPerson = json['contact_person'];
//     contactPhone = json['contact_phone'];
//     contactEmail = json['contact_email'];
//     timezone = json['timezone'];
//     userId = json['user_id'];
//     maxUser = json['max_user'];
//     employeeSettings = json['employee_settings'];
//     isActive = json['is_active'];
//     displayLogoHeader = json['display_logo_header'];
//     pageBreakdown = json['page_breakdown'];
//     sortCallConfiguration = json['sort_call_configuration'];
//     internetConfirm = json['internet_confirm'];
//     passOption = json['pass_option'];
//     reports = json['reports'];
//     employeeTitle = json['employee_title'];
//     callAssignmentTitle = json['call_assignment_title'];
//     callSheetTitle = json['call_sheet_title'];
//     hideEmptyDays = json['hide_empty_days'];
//     ignoreDecline = json['ignore_decline'];
//     skillLock = json['skill_lock'];
//     wishlistLock = json['wishlist_lock'];
//     ignorelistLock = json['ignorelist_lock'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     billingContact = json['billing_contact'];
//     billingPhone = json['billing_phone'];
//     billingEmail = json['billing_email'];
//     logo = json['logo'];
//     loginImage = json['login_image'];
//     defaultSort = json['default_sort'];
//     defaultEmployeeSort = json['default_employee_sort'];
//     defaultCallSort = json['default_call_sort'];
//     defaultPhonesheetSort = json['default_phonesheet_sort'];
//     loginPageMessage = json['login_page_message'];
//     turnover = json['turnover'];
//     phonesheetTs = json['phonesheet_ts'];
//     customField1 = json['custom_field_1'];
//     customField2 = json['custom_field_2'];
//     viewSwitch = json['view_switch'];
//     customCallClearMssg = json['custom_call_clear_mssg'];
//     customCallEditMssg = json['custom_call_edit_mssg'];
//     currency = json['currency'];
//     widgetTags = json['widget_tags'];
//     gcsSigninSheetTemplate = json['gcs_signin_sheet_template'];
//     gcsSigninSheetData = json['gcs_signin_sheet_data'];
//     assignPageDefaultStatus = json['assign_page_default_status'];
//     powerSteward = json['power_steward'];
//     globalSkills = json['global_skills'];
//     notifyTemplates = json['notify_templates'];
//     batchNotifyFlag = json['batch_notify_flag'];
//     mailingListVisibilityFlag = json['mailing_list_visibility_flag'];
//     estimatePayrollButton = json['estimate_payroll_button'];
//     supportSiteUrl = json['support_site_url'];
//   }
// }

// class SignInSheet {
//   String? name;
//   String? value;

//   SignInSheet({this.name, this.value});

//   SignInSheet.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     value = json['value'];
//   }
// }

// class JobInfoConfigPast {
//   String? s1;
//   String? s2;
//   String? s4;
//   String? s5;
//   String? s6;
//   String? s8;
//   String? s9;

//   JobInfoConfigPast(
//       {this.s1, this.s2, this.s4, this.s5, this.s6, this.s8, this.s9});

//   JobInfoConfigPast.fromJson(Map<String, dynamic> json) {
//     s1 = json['1'];
//     s2 = json['2'];
//     s4 = json['4'];
//     s5 = json['5'];
//     s6 = json['6'];
//     s8 = json['8'];
//     s9 = json['9'];
//   }
// }

// class NotificationConfig {
//   String? email;
//   String? sms;
//   String? countryCode;

//   NotificationConfig({this.email, this.sms, this.countryCode});

//   NotificationConfig.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     sms = json['sms'];
//     countryCode = json['countryCode'];
//   }
// }

// class Venue {
//   String? id;
//   String? clientId;
//   String? name;
//   String? createdAt;
//   String? updatedAt;
//   List<Addresses>? addresses;

//   Venue(
//       {this.id,
//       this.clientId,
//       this.name,
//       this.createdAt,
//       this.updatedAt,
//       this.addresses});

//   Venue.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     clientId = json['client_id'];
//     name = json['name'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['addresses'] != null) {
//       addresses = <Addresses>[];
//       json['addresses'].forEach((v) {
//         addresses!.add(Addresses.fromJson(v));
//       });
//     }
//   }
// }

// class Addresses {
//   String? id;
//   String? address;
//   String? addressableId;
//   String? addressableType;
//   String? country;
//   String? municipality;
//   String? postcode;
//   String? stateProvince;
//   int? status;
//   String? createdAt;
//   String? updatedAt;

//   Addresses(
//       {this.id,
//       this.address,
//       this.addressableId,
//       this.addressableType,
//       this.country,
//       this.municipality,
//       this.postcode,
//       this.stateProvince,
//       this.status,
//       this.createdAt,
//       this.updatedAt});

//   Addresses.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     address = json['address'];
//     addressableId = json['addressable_id'];
//     addressableType = json['addressable_type'];
//     country = json['country'];
//     municipality = json['municipality'];
//     postcode = json['postcode'];
//     stateProvince = json['state_province'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
// }

// class Employee {
//   String? id;
//   String? employableId;
//   String? employableType;
//   String? employeeListId;
//   String? employeeStatusId;
//   String? roleId;
//   String? customField1;
//   String? customField2;
//   int? totalShifts;
//   int? totalShiftWeekly;
//   int? totalShiftYTD;
//   int? shiftYTDLastYear;
//   int? totalShiftJulyJune;
//   int? totalDecline;
//   int? totalDeclineWeekly;
//   int? totalDeclineYTD;
//   int? declineYTDLastYear;
//   int? totalDeclineJulyJune;
//   int? isMember;
//   int? smsNotification;
//   int? emailNotification;
//   int? appNotification;
//   int? stopNotification;
//   int? skillLock;
//   int? isActive;
//   String? image;
//   String? dateFormat;
//   String? timeFormat;
//   String? memberSince;
//   String? dateOfHire;
//   String? createdAt;
//   String? updatedAt;
//   String? pllInventory;
//   String? lastOffer;
//   Employable? employable;

//   Employee(
//       {this.id,
//       this.employableId,
//       this.employableType,
//       this.employeeListId,
//       this.employeeStatusId,
//       this.roleId,
//       this.customField1,
//       this.customField2,
//       this.totalShifts,
//       this.totalShiftWeekly,
//       this.totalShiftYTD,
//       this.shiftYTDLastYear,
//       this.totalShiftJulyJune,
//       this.totalDecline,
//       this.totalDeclineWeekly,
//       this.totalDeclineYTD,
//       this.declineYTDLastYear,
//       this.totalDeclineJulyJune,
//       this.isMember,
//       this.smsNotification,
//       this.emailNotification,
//       this.appNotification,
//       this.stopNotification,
//       this.skillLock,
//       this.isActive,
//       this.image,
//       this.dateFormat,
//       this.timeFormat,
//       this.memberSince,
//       this.dateOfHire,
//       this.createdAt,
//       this.updatedAt,
//       this.pllInventory,
//       this.lastOffer,
//       this.employable});

//   Employee.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     employableId = json['employable_id'];
//     employableType = json['employable_type'];
//     employeeListId = json['employee_list_id'];
//     employeeStatusId = json['employee_status_id'];
//     roleId = json['role_id'];
//     customField1 = json['custom_field1'];
//     customField2 = json['custom_field2'];
//     totalShifts = json['total_shifts'];
//     totalShiftWeekly = json['total_shift_weekly'];
//     totalShiftYTD = json['total_shift_YTD'];
//     shiftYTDLastYear = json['shift_YTD_last_year'];
//     totalShiftJulyJune = json['total_shift_july_june'];
//     totalDecline = json['total_decline'];
//     totalDeclineWeekly = json['total_decline_weekly'];
//     totalDeclineYTD = json['total_decline_YTD'];
//     declineYTDLastYear = json['decline_YTD_last_year'];
//     totalDeclineJulyJune = json['total_decline_july_june'];
//     isMember = json['is_member'];
//     smsNotification = json['sms_notification'];
//     emailNotification = json['email_notification'];
//     appNotification = json['app_notification'];
//     stopNotification = json['stop_notification'];
//     skillLock = json['skill_lock'];
//     isActive = json['is_active'];
//     image = json['image'];
//     dateFormat = json['date_format'];
//     timeFormat = json['time_format'];
//     memberSince = json['member_since'];
//     dateOfHire = json['date_of_hire'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     pllInventory = json['pll_inventory'];
//     lastOffer = json['last_offer'];
//     employable = json['employable'] != null
//         ? Employable.fromJson(json['employable'])
//         : null;
//   }
// }

// class Employable {
//   String? id;
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
//   String? deletedTimestamp;
//   int? twoFactorAuth;
//   String? code;
//   String? language;
//   String? deviceToken;

//   Employable(
//       {this.id,
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
//       this.deletedTimestamp,
//       this.twoFactorAuth,
//       this.code,
//       this.language,
//       this.deviceToken});

//   Employable.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
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
//     deletedTimestamp = json['deleted_timestamp'];
//     twoFactorAuth = json['two_factor_auth'];
//     code = json['code'];
//     language = json['language'];
//     deviceToken = json['device_token'];
//   }
// }

// class Employer {
//   String? id;
//   String? name;
//   String? email;
//   String? image;
//   String? createdAt;
//   String? updatedAt;
//   List<EmployerUsers>? employerUsers;

//   Employer(
//       {this.id,
//       this.name,
//       this.email,
//       this.image,
//       this.createdAt,
//       this.updatedAt,
//       this.employerUsers});

//   Employer.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     image = json['image'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['employer_users'] != null) {
//       employerUsers = <EmployerUsers>[];
//       json['employer_users'].forEach((v) {
//         employerUsers!.add(EmployerUsers.fromJson(v));
//       });
//     }
//   }
// }

// class EmployerUsers {
//   String? id;
//   String? userId;
//   String? employerId;
//   String? roleId;
//   String? createdAt;
//   String? updatedAt;
//   User? user;

//   EmployerUsers(
//       {this.id,
//       this.userId,
//       this.employerId,
//       this.roleId,
//       this.createdAt,
//       this.updatedAt,
//       this.user});

//   EmployerUsers.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     employerId = json['employer_id'];
//     roleId = json['role_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//   }
// }

// class User {
//   String? id;
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
//   String? createdAt;
//   String? updatedAt;
//   String? deletedTimestamp;
//   int? twoFactorAuth;
//   String? language;

//   User({
//     this.id,
//     this.displayName,
//     this.image,
//     this.email,
//     this.emailValidated,
//     this.secondaryEmail,
//     this.driversLicense,
//     this.socialSecurity,
//     this.mothersMaidenName,
//     this.firstName,
//     this.lastName,
//     this.rememberToken,
//     this.roleId,
//     this.statusId,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedTimestamp,
//     this.twoFactorAuth,
//     this.language,
//   });

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
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
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedTimestamp = json['deleted_timestamp'];
//     twoFactorAuth = json['two_factor_auth'];
//     language = json['language'];
//   }
// }

// class Status {
//   String? id;
//   String? description;
//   String? name;
//   String? statusableType;
//   String? createdAt;
//   String? updatedAt;

//   Status(
//       {this.id,
//       this.description,
//       this.name,
//       this.statusableType,
//       this.createdAt,
//       this.updatedAt});

//   Status.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     description = json['description'];
//     name = json['name'];
//     statusableType = json['statusable_type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
// }

// class Notes {
//   String? id;
//   String? activity;
//   String? content;
//   String? noteableId;
//   String? noteableType;
//   String? createdAt;
//   String? updatedAt;

//   Notes(
//       {this.id,
//       this.activity,
//       this.content,
//       this.noteableId,
//       this.noteableType,
//       this.createdAt,
//       this.updatedAt});

//   Notes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     activity = json['activity'];
//     content = json['content'];
//     noteableId = json['noteable_id'];
//     noteableType = json['noteable_type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
// }
