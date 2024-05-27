// Due to an unusual data parsing issue, unused classes and objects have been commented out.

class ClientDetailsModel {
  String? id;
  // String? note;
  // String? country;
  // String? subdomain;
  // String? contactPerson;
  // String? contactPhone;
  // String? contactEmail;
  String? timezone;
  // String? userId;
  // int? maxUser;
  Settings? settings;
  // String? employeeSettings;
  // int? isActive;
  // int? displayLogoHeader;
  // int? pageBreakdown;
  // String? sortCallConfiguration;
  int? internetConfirm;
  int? passOption;
  // int? reports;
  // int? employeeTitle;
  // int? callAssignmentTitle;
  // int? callSheetTitle;
  // int? hideEmptyDays;
  // int? ignoreDecline;
  // int? skillLock;
  int? wishlistLock;
  int? ignorelistLock;
  // String? createdAt;
  // String? updatedAt;
  // dynamic deletedAt;
  // String? billingContact;
  // String? billingPhone;
  // String? billingEmail;
  String? logo;
  // String? loginImage;
  // String? defaultSort;
  // String? defaultEmployeeSort;
  // String? defaultCallSort;
  // String? defaultPhonesheetSort;
  // String? loginPageMessage;
  // String? turnover;
  // String? phonesheetTs;
  // dynamic stewardSkillId;
  // String? customField1;
  // String? customField2;
  // int? viewSwitch;
  // String? customCallClearMssg;
  // String? customCallEditMssg;
  // String? currency;
  // String? widgetTags;
  // String? gcsSigninSheetTemplate;
  // String? gcsSigninSheetData;
  // String? assignPageDefaultStatus;
  // int? powerSteward;
  // int? globalSkills;
  // String? notifyTemplates;
  // int? batchNotifyFlag;
  // int? mailingListVisibilityFlag;
  // int? estimatePayrollButton;
  // String? supportSiteUrl;
  // User? user;
  // List<TinyUrl>? tinyUrl;
  // dynamic payrollActiveArjs;
  // List<ClientEmployees>? clientEmployees;

  ClientDetailsModel({
    this.id,
    // this.note,
    // this.country,
    // this.subdomain,
    // this.contactPerson,
    // this.contactPhone,
    // this.contactEmail,
    this.timezone,
    // this.userId,
    // this.maxUser,
    this.settings,
    // this.employeeSettings,
    // this.isActive,
    // this.displayLogoHeader,
    // this.pageBreakdown,
    // this.sortCallConfiguration,
    this.internetConfirm,
    this.passOption,
    // this.reports,
    // this.employeeTitle,
    // this.callAssignmentTitle,
    // this.callSheetTitle,
    // this.hideEmptyDays,
    // this.ignoreDecline,
    // this.skillLock,
    this.wishlistLock,
    this.ignorelistLock,
    // this.createdAt,
    // this.updatedAt,
    // this.deletedAt,
    // this.billingContact,
    // this.billingPhone,
    // this.billingEmail,
    this.logo,
    // this.loginImage,
    // this.defaultSort,
    // this.defaultEmployeeSort,
    // this.defaultCallSort,
    // this.defaultPhonesheetSort,
    // this.loginPageMessage,
    // this.turnover,
    // this.phonesheetTs,
    // this.stewardSkillId,
    // this.customField1,
    // this.customField2,
    // this.viewSwitch,
    // this.customCallClearMssg,
    // this.customCallEditMssg,
    // this.currency,
    // this.widgetTags,
    // this.gcsSigninSheetTemplate,
    // this.gcsSigninSheetData,
    // this.assignPageDefaultStatus,
    // this.powerSteward,
    // this.globalSkills,
    // this.notifyTemplates,
    // this.batchNotifyFlag,
    // this.mailingListVisibilityFlag,
    // this.estimatePayrollButton,
    // this.supportSiteUrl,
    // this.user,
    // this.tinyUrl,
    // this.payrollActiveArjs,
    // this.clientEmployees
  });

  ClientDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // note = json['note'];
    // country = json['country'];
    // subdomain = json['subdomain'];
    // contactPerson = json['contact_person'];
    // contactPhone = json['contact_phone'];
    // contactEmail = json['contact_email'];
    timezone = json['timezone'];
    // userId = json['user_id'];
    // maxUser = json['max_user'];
    settings =
        json['settings'] != null ? Settings.fromJson(json['settings']) : null;
    // employeeSettings = json['employee_settings'];
    // isActive = json['is_active'];
    // displayLogoHeader = json['display_logo_header'];
    // pageBreakdown = json['page_breakdown'];
    // sortCallConfiguration = json['sort_call_configuration'];
    internetConfirm = json['internet_confirm'];
    passOption = json['pass_option'];
    // reports = json['reports'];
    // employeeTitle = json['employee_title'];
    // callAssignmentTitle = json['call_assignment_title'];
    // callSheetTitle = json['call_sheet_title'];
    // hideEmptyDays = json['hide_empty_days'];
    // ignoreDecline = json['ignore_decline'];
    // skillLock = json['skill_lock'];
    wishlistLock = json['wishlist_lock'];
    ignorelistLock = json['ignorelist_lock'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
    // billingContact = json['billing_contact'];
    // billingPhone = json['billing_phone'];
    // billingEmail = json['billing_email'];
    logo = json['logo'];
    // loginImage = json['login_image'];
    // defaultSort = json['default_sort'];
    // defaultEmployeeSort = json['default_employee_sort'];
    // defaultCallSort = json['default_call_sort'];
    // defaultPhonesheetSort = json['default_phonesheet_sort'];
    // loginPageMessage = json['login_page_message'];
    // turnover = json['turnover'];
    // phonesheetTs = json['phonesheet_ts'];
    // stewardSkillId = json['steward_skill_id'];
    // customField1 = json['custom_field_1'];
    // customField2 = json['custom_field_2'];
    // viewSwitch = json['view_switch'];
    // customCallClearMssg = json['custom_call_clear_mssg'];
    // customCallEditMssg = json['custom_call_edit_mssg'];
    // currency = json['currency'];
    // widgetTags = json['widget_tags'];
    // gcsSigninSheetTemplate = json['gcs_signin_sheet_template'];
    // gcsSigninSheetData = json['gcs_signin_sheet_data'];
    // assignPageDefaultStatus = json['assign_page_default_status'];
    // powerSteward = json['power_steward'];
    // globalSkills = json['global_skills'];
    // notifyTemplates = json['notify_templates'];
    // batchNotifyFlag = json['batch_notify_flag'];
    // mailingListVisibilityFlag = json['mailing_list_visibility_flag'];
    // estimatePayrollButton = json['estimate_payroll_button'];
    // supportSiteUrl = json['support_site_url'];
    // user = json['user'] != null ? User.fromJson(json['user']) : null;
    // if (json['tiny_url'] != null) {
    //   tinyUrl = <TinyUrl>[];
    //   json['tiny_url'].forEach((v) {
    //     tinyUrl!.add(TinyUrl.fromJson(v));
    //   });
    // }
    // payrollActiveArjs = json['payroll_active_arjs'];
    // if (json['client_employees'] != null) {
    //   clientEmployees = <ClientEmployees>[];
    //   json['client_employees'].forEach((v) {
    //     clientEmployees!.add(ClientEmployees.fromJson(v));
    //   });
    // }
  }
}

class Settings {
  List<String>? jobTypePast;
  List<SignInSheet>? signInSheet;
  List<String>? jobTypeFuture;
  // List<CallDataConfig>? callDataConfig;
  List<String>? jobInfoConfigPast;
  List<String>? callAssignmentConfig;
  List<String>? jobInfoConfigFuture;
  String? notesDocumentsConfig;
  NotificationConfig? notificationConfig;

  Settings(
      {this.jobTypePast,
      this.signInSheet,
      this.jobTypeFuture,
      // this.callDataConfig,
      this.jobInfoConfigPast,
      this.callAssignmentConfig,
      this.jobInfoConfigFuture,
      this.notesDocumentsConfig,
      this.notificationConfig});

  Settings.fromJson(Map<String, dynamic> json) {
    jobTypePast = json['job-type-past'].cast<String>();
    if (json['sign-in-sheet'] != null) {
      signInSheet = <SignInSheet>[];
      json['sign-in-sheet'].forEach((v) {
        signInSheet!.add(SignInSheet.fromJson(v));
      });
    }
    jobTypeFuture = json['job-type-future'].cast<String>();
    // if (json['call-data-config'] != null) {
    //   callDataConfig = <CallDataConfig>[];
    //   json['call-data-config'].forEach((v) {
    //     callDataConfig!.add(CallDataConfig.fromJson(v));
    //   });
    // }

    jobInfoConfigPast = json["job-info-config-past"] == null
        ? null
        : json["job-info-config-past"] is Map
            ? (json["job-info-config-past"] as Map)
                .values
                .cast<String>()
                .toList()
            : json['job-info-config-past'].cast<String>();
    callAssignmentConfig = json["call-assignment-config"] == null
        ? null
        : json["call-assignment-config"] is Map
            ? (json["call-assignment-config"] as Map)
                .values
                .cast<String>()
                .toList()
            : json['call-assignment-config'].cast<String>();
    jobInfoConfigFuture = json["job-info-config-future"] == null
        ? null
        : json["job-info-config-future"] is Map
            ? (json["job-info-config-future"] as Map)
                .values
                .cast<String>()
                .toList()
            : json['job-info-config-future'].cast<String>();
    notesDocumentsConfig = json["notes-documents-config"] == null
        ? null
        : json['notes-documents-config'];
    notificationConfig = json['notification-config'] != null
        ? NotificationConfig.fromJson(json['notification-config'])
        : null;
  }
}

class SignInSheet {
  String? name;
  String? value;

  SignInSheet({this.name, this.value});

  SignInSheet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }
}

class JobInfoConfigPast {
  String? s1;
  String? s2;
  String? s4;
  String? s5;
  String? s6;
  String? s8;
  String? s9;

  JobInfoConfigPast(
      {this.s1, this.s2, this.s4, this.s5, this.s6, this.s8, this.s9});

  JobInfoConfigPast.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s8 = json['8'];
    s9 = json['9'];
  }
}

class NotificationConfig {
  String? email;
  String? sms;
  String? countryCode;

  NotificationConfig({this.email, this.sms, this.countryCode});

  NotificationConfig.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    sms = json['sms'];
    countryCode = json['countryCode'];
  }
}

class User {
  String? id;
  dynamic activity;
  String? displayName;
  String? image;
  String? email;
  int? emailValidated;
  String? secondaryEmail;
  String? driversLicense;
  String? socialSecurity;
  String? mothersMaidenName;
  String? firstName;
  String? lastName;
  String? rememberToken;
  String? roleId;
  String? statusId;
  String? dob;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? deletedTimestamp;
  dynamic resumeUrl;
  int? twoFactorAuth;
  String? code;
  String? language;
  String? deviceToken;

  User(
      {this.id,
      this.activity,
      this.displayName,
      this.image,
      this.email,
      this.emailValidated,
      this.secondaryEmail,
      this.driversLicense,
      this.socialSecurity,
      this.mothersMaidenName,
      this.firstName,
      this.lastName,
      this.rememberToken,
      this.roleId,
      this.statusId,
      this.dob,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.deletedTimestamp,
      this.resumeUrl,
      this.twoFactorAuth,
      this.code,
      this.language,
      this.deviceToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activity = json['activity'];
    displayName = json['display_name'];
    image = json['image'];
    email = json['email'];
    emailValidated = json['email_validated'];
    secondaryEmail = json['secondary_email'];
    driversLicense = json['drivers_license'];
    socialSecurity = json['social_security'];
    mothersMaidenName = json['mothers_maiden_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    rememberToken = json['remember_token'];
    roleId = json['role_id'];
    statusId = json['status_id'];
    dob = json['dob'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    deletedTimestamp = json['deleted_timestamp'];
    resumeUrl = json['resume_url'];
    twoFactorAuth = json['two_factor_auth'];
    code = json['code'];
    language = json['language'];
    deviceToken = json['device_token'];
  }
}

class TinyUrl {
  String? id;
  String? clientId;
  String? name;
  dynamic longUrl;
  String? shortUrl;
  String? createdAt;
  String? updatedAt;

  TinyUrl(
      {this.id,
      this.clientId,
      this.name,
      this.longUrl,
      this.shortUrl,
      this.createdAt,
      this.updatedAt});

  TinyUrl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    name = json['name'];
    longUrl = json['long_url'];
    shortUrl = json['short_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class ClientEmployees {
  int? id;
  String? employeeId;
  String? clientId;
  String? createdAt;
  String? updatedAt;
  Employee? employee;

  ClientEmployees(
      {this.id,
      this.employeeId,
      this.clientId,
      this.createdAt,
      this.updatedAt,
      this.employee});

  ClientEmployees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    clientId = json['client_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    employee =
        json['employee'] != null ? Employee.fromJson(json['employee']) : null;
  }
}

class Employee {
  String? id;
  dynamic activity;
  String? employableId;
  String? employableType;
  String? employeeListId;
  String? employeeStatusId;
  String? roleId;
  dynamic meta;
  String? customField1;
  String? customField2;
  int? totalShifts;
  int? totalShiftWeekly;
  int? totalShiftYTD;
  int? shiftYTDLastYear;
  int? totalShiftJulyJune;
  int? totalDecline;
  int? totalDeclineWeekly;
  int? totalDeclineYTD;
  int? declineYTDLastYear;
  int? totalDeclineJulyJune;
  int? isMember;
  int? smsNotification;
  int? emailNotification;
  int? appNotification;
  int? stopNotification;
  int? skillLock;
  int? isActive;
  dynamic seniority;
  String? image;
  String? dateFormat;
  String? timeFormat;
  String? memberSince;
  String? dateOfHire;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? pllInventory;
  String? lastOffer;
  dynamic mergeNotes;

  Employee(
      {this.id,
      this.activity,
      this.employableId,
      this.employableType,
      this.employeeListId,
      this.employeeStatusId,
      this.roleId,
      this.meta,
      this.customField1,
      this.customField2,
      this.totalShifts,
      this.totalShiftWeekly,
      this.totalShiftYTD,
      this.shiftYTDLastYear,
      this.totalShiftJulyJune,
      this.totalDecline,
      this.totalDeclineWeekly,
      this.totalDeclineYTD,
      this.declineYTDLastYear,
      this.totalDeclineJulyJune,
      this.isMember,
      this.smsNotification,
      this.emailNotification,
      this.appNotification,
      this.stopNotification,
      this.skillLock,
      this.isActive,
      this.seniority,
      this.image,
      this.dateFormat,
      this.timeFormat,
      this.memberSince,
      this.dateOfHire,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.pllInventory,
      this.lastOffer,
      this.mergeNotes});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activity = json['activity'];
    employableId = json['employable_id'];
    employableType = json['employable_type'];
    employeeListId = json['employee_list_id'];
    employeeStatusId = json['employee_status_id'];
    roleId = json['role_id'];
    meta = json['meta'];
    customField1 = json['custom_field1'];
    customField2 = json['custom_field2'];
    totalShifts = json['total_shifts'];
    totalShiftWeekly = json['total_shift_weekly'];
    totalShiftYTD = json['total_shift_YTD'];
    shiftYTDLastYear = json['shift_YTD_last_year'];
    totalShiftJulyJune = json['total_shift_july_june'];
    totalDecline = json['total_decline'];
    totalDeclineWeekly = json['total_decline_weekly'];
    totalDeclineYTD = json['total_decline_YTD'];
    declineYTDLastYear = json['decline_YTD_last_year'];
    totalDeclineJulyJune = json['total_decline_july_june'];
    isMember = json['is_member'];
    smsNotification = json['sms_notification'];
    emailNotification = json['email_notification'];
    appNotification = json['app_notification'];
    stopNotification = json['stop_notification'];
    skillLock = json['skill_lock'];
    isActive = json['is_active'];
    seniority = json['seniority'];
    image = json['image'];
    dateFormat = json['date_format'];
    timeFormat = json['time_format'];
    memberSince = json['member_since'];
    dateOfHire = json['date_of_hire'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pllInventory = json['pll_inventory'];
    lastOffer = json['last_offer'];
    mergeNotes = json['merge_notes'];
  }
}
