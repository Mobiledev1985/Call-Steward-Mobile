// Due to an unusual data parsing issue, unused classes and objects have been commented out.

class MuaEmployee {
  MuaEmployee({
    this.statusCode,
    this.statusMessage,
    this.user,
    // required this.role,
    // required this.permission,
  });

  String? statusCode;
  String? statusMessage;
  User? user;
  // Role role;
  // Permission permission;

  factory MuaEmployee.fromJson(Map<String, dynamic> json) => MuaEmployee(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        user: User.fromJson(json["user"]),
        // role: Role.fromJson(json["role"]),
        // permission: Permission.fromJson(json["permission"]),
      );
}

class Permission {
  Permission({
    required this.id,
    required this.roleId,
    required this.menuPermission,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String? roleId;
  String? menuPermission;
  DateTime createdAt;
  DateTime updatedAt;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        id: json["id"],
        roleId: json["role_id"],
        menuPermission: json["menu_permission"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

// class Role {
//   Role({
//     required this.id,
//     required this.description,
//     required this.name,
//     required this.slug,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.permission,
//   });

//   String id;
//   String description;
//   String name;
//   String slug;
//   DateTime createdAt;
//   DateTime updatedAt;
//   Permission permission;

//   factory Role.fromJson(Map<String, dynamic> json) => Role(
//         id: json["id"],
//         description: json["description"],
//         name: json["name"],
//         slug: json["slug"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         permission: Permission.fromJson(json["permission"]),
//       );
// }

class User {
  User({
    required this.id,
    required this.email,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.employees,
    required this.phones,
  });

  String id;
  String? email;
  String? image;
  String? firstName;
  String? lastName;
  String? displayName;
  List<Employee> employees;
  List<Phone> phones;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        image: json["image"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        displayName: json["display_name"],
        employees: List<Employee>.from(
            json["employees"].map((x) => Employee.fromJson(x))),
        phones: List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
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
    required this.roleId,
    // this.meta,
    // required this.customField1,
    // required this.customField2,
    // required this.totalShifts,
    // required this.totalShiftWeekly,
    // required this.totalShiftYtd,
    // required this.shiftYtdLastYear,
    // required this.totalShiftJulyJune,
    // this.totalDecline,
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
    // required this.seniority,
    // required this.image,
    // required this.dateFormat,
    // required this.timeFormat,
    // required this.memberSince,
    // required this.dateOfHire,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    // required this.pllInventory,
    // this.lastOffer,
    // this.mergeNotes,
    this.clientEmployee,
    // required this.employeeStatus,
    // required this.role,
    // required this.isSteward,
  });

  String id;
  // dynamic activity;
  // String employableId;
  // String employableType;
  // String employeeListId;
  // String employeeStatusId;
  String? roleId;
  // dynamic meta;
  // String customField1;
  // String customField2;
  // int totalShifts;
  // int totalShiftWeekly;
  // int totalShiftYtd;
  // int shiftYtdLastYear;
  // int totalShiftJulyJune;
  // int? totalDecline;
  // int totalDeclineWeekly;
  // int totalDeclineYtd;
  // int declineYtdLastYear;
  // int totalDeclineJulyJune;
  // int isMember;
  // int smsNotification;
  // int emailNotification;
  // int appNotification;
  // int stopNotification;
  // int skillLock;
  // int isActive;
  // String seniority;
  // String image;
  // String dateFormat;
  // String timeFormat;
  // String memberSince;
  // String dateOfHire;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;
  // String pllInventory;
  // DateTime? lastOffer;
  // dynamic mergeNotes;
  ClientEmployee? clientEmployee;
  // EmployeeStatus employeeStatus;
  // Role role;
  // bool isSteward;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        // activity: json["activity"],
        // employableId: json["employable_id"],
        // employableType: json["employable_type"],
        // employeeListId: json["employee_list_id"],
        // employeeStatusId: json["employee_status_id"],
        roleId: json["role_id"],
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
        // seniority: json["seniority"],
        // image: json["image"],
        // dateFormat: json["date_format"],
        // timeFormat: json["time_format"],
        // memberSince: json["member_since"],
        // dateOfHire: json["date_of_hire"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        // pllInventory: json["pll_inventory"],
        // lastOffer: json["last_offer"] == null
        //     ? null
        //     : DateTime.parse(json["last_offer"]),
        // mergeNotes: json["merge_notes"],
        clientEmployee: json["client_employee"] == null
            ? null
            : ClientEmployee.fromJson(json["client_employee"]),
        // employeeStatus: EmployeeStatus.fromJson(json["employee_status"]),
        // role: Role.fromJson(json["role"]),
        // isSteward: json["is_steward"],
      );
}

class ClientEmployee {
  ClientEmployee({
    required this.id,
    // required this.employeeId,
    required this.clientId,
    required this.createdAt,
    required this.updatedAt,
    required this.clients,
  });

  int id;
  // String employeeId;
  String? clientId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Clients clients;

  factory ClientEmployee.fromJson(Map<String, dynamic> json) => ClientEmployee(
        id: json["id"],
        // employeeId: json["employee_id"],
        clientId: json["client_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        clients: Clients.fromJson(json["clients"]),
      );
}

class Clients {
  Clients({
    required this.id,
    // required this.note,
    // required this.country,
    required this.subdomain,
    // required this.contactPerson,
    // required this.contactPhone,
    // required this.contactEmail,
    required this.timezone,
    // required this.userId,
    // required this.maxUser,
    // required this.settings,
    // required this.employeeSettings,
    // required this.isActive,
    // required this.displayLogoHeader,
    // required this.pageBreakdown,
    // required this.sortCallConfiguration,
    // required this.internetConfirm,
    // required this.passOption,
    // required this.reports,
    // required this.employeeTitle,
    // required this.callAssignmentTitle,
    // required this.callSheetTitle,
    // required this.hideEmptyDays,
    // required this.ignoreDecline,
    // required this.skillLock,
    // required this.wishlistLock,
    // required this.ignorelistLock,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    // required this.billingContact,
    // required this.billingPhone,
    // required this.billingEmail,
    // required this.logo,
    required this.loginImage,
    // required this.defaultSort,
    // required this.defaultEmployeeSort,
    // required this.defaultCallSort,
    // required this.defaultPhonesheetSort,
    required this.loginPageMessage,
    // required this.turnover,
    // required this.phonesheetTs,
    // this.stewardSkillId,
    // required this.customField1,
    // required this.customField2,
    // required this.viewSwitch,
    // required this.customCallClearMssg,
    // required this.customCallEditMssg,
    // required this.currency,
    // required this.widgetTags,
    // required this.gcsSigninSheetTemplate,
    // required this.gcsSigninSheetData,
    // required this.assignPageDefaultStatus,
    // required this.powerSteward,
    // required this.globalSkills,
    // required this.notifyTemplates,
    // required this.batchNotifyFlag,
    // required this.mailingListVisibilityFlag,
    // required this.estimatePayrollButton,
    // required this.supportSiteUrl,
  });

  String id;
  // String note;
  // String country;
  String? subdomain;
  // String contactPerson;
  // String contactPhone;
  // String contactEmail;
  String? timezone;
  // String userId;
  // int maxUser;
  // Settings settings;
  // String employeeSettings;
  // int isActive;
  // int displayLogoHeader;
  // int pageBreakdown;
  // String sortCallConfiguration;
  // int internetConfirm;
  // int passOption;
  // int reports;
  // int employeeTitle;
  // int callAssignmentTitle;
  // int callSheetTitle;
  // int hideEmptyDays;
  // int ignoreDecline;
  // int skillLock;
  // int wishlistLock;
  // int ignorelistLock;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;
  // String billingContact;
  // String billingPhone;
  // String billingEmail;
  // String logo;
  String? loginImage;
  // String defaultSort;
  // String defaultEmployeeSort;
  // String defaultCallSort;
  // String defaultPhonesheetSort;
  String? loginPageMessage;
  // String turnover;
  // String phonesheetTs;
  // dynamic stewardSkillId;
  // String customField1;
  // String customField2;
  // int viewSwitch;
  // String customCallClearMssg;
  // String customCallEditMssg;
  // String currency;
  // String widgetTags;
  // String gcsSigninSheetTemplate;
  // String gcsSigninSheetData;
  // String assignPageDefaultStatus;
  // int powerSteward;
  // int globalSkills;
  // String notifyTemplates;
  // int batchNotifyFlag;
  // int mailingListVisibilityFlag;
  // int estimatePayrollButton;
  // String supportSiteUrl;

  factory Clients.fromJson(Map<String, dynamic> json) => Clients(
        id: json["id"],
        // note: json["note"],
        // country: json["country"],
        subdomain: json["subdomain"],
        // contactPerson: json["contact_person"],
        // contactPhone: json["contact_phone"],
        // contactEmail: json["contact_email"],
        timezone: json["timezone"],
        // userId: json["user_id"],
        // maxUser: json["max_user"],
        // settings: Settings.fromJson(json["settings"]),
        // employeeSettings: json["employee_settings"],
        // isActive: json["is_active"],
        // displayLogoHeader: json["display_logo_header"],
        // pageBreakdown: json["page_breakdown"],
        // sortCallConfiguration: json["sort_call_configuration"],
        // internetConfirm: json["internet_confirm"],
        // passOption: json["pass_option"],
        // reports: json["reports"],
        // employeeTitle: json["employee_title"],
        // callAssignmentTitle: json["call_assignment_title"],
        // callSheetTitle: json["call_sheet_title"],
        // hideEmptyDays: json["hide_empty_days"],
        // ignoreDecline: json["ignore_decline"],
        // skillLock: json["skill_lock"],
        // wishlistLock: json["wishlist_lock"],
        // ignorelistLock: json["ignorelist_lock"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        // billingContact: json["billing_contact"],
        // billingPhone: json["billing_phone"],
        // billingEmail: json["billing_email"],
        // logo: json["logo"],
        loginImage: json["login_image"],
        // defaultSort: json["default_sort"],
        // defaultEmployeeSort: json["default_employee_sort"],
        // defaultCallSort: json["default_call_sort"],
        // defaultPhonesheetSort: json["default_phonesheet_sort"],
        loginPageMessage: json["login_page_message"],
        // turnover: json["turnover"],
        // phonesheetTs: json["phonesheet_ts"],
        // stewardSkillId: json["steward_skill_id"],
        // customField1: json["custom_field_1"],
        // customField2: json["custom_field_2"],
        // viewSwitch: json["view_switch"],
        // customCallClearMssg: json["custom_call_clear_mssg"],
        // customCallEditMssg: json["custom_call_edit_mssg"],
        // currency: json["currency"],
        // widgetTags: json["widget_tags"],
        // gcsSigninSheetTemplate: json["gcs_signin_sheet_template"],
        // gcsSigninSheetData: json["gcs_signin_sheet_data"],
        // assignPageDefaultStatus: json["assign_page_default_status"],
        // powerSteward: json["power_steward"],
        // globalSkills: json["global_skills"],
        // notifyTemplates: json["notify_templates"],
        // batchNotifyFlag: json["batch_notify_flag"],
        // mailingListVisibilityFlag: json["mailing_list_visibility_flag"],
        // estimatePayrollButton: json["estimate_payroll_button"],
        // supportSiteUrl: json["support_site_url"],
      );
}

class Settings {
  Settings({
    required this.jobTypePast,
    required this.signInSheet,
    required this.jobTypeFuture,
    required this.callDataConfig,
    required this.jobInfoConfigPast,
    required this.callAssignmentConfig,
    required this.jobInfoConfigFuture,
    required this.notesDocumentsConfig,
    required this.notificationConfig,
  });

  List<String> jobTypePast;
  List<CallDataConfig> signInSheet;
  List<String> jobTypeFuture;
  List<CallDataConfig> callDataConfig;
  Map<String, String> jobInfoConfigPast;
  List<String> callAssignmentConfig;
  List<String> jobInfoConfigFuture;
  String notesDocumentsConfig;
  NotificationConfig notificationConfig;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        jobTypePast: List<String>.from(json["job-type-past"].map((x) => x)),
        signInSheet: List<CallDataConfig>.from(
            json["sign-in-sheet"].map((x) => CallDataConfig.fromJson(x))),
        jobTypeFuture: List<String>.from(json["job-type-future"].map((x) => x)),
        callDataConfig: List<CallDataConfig>.from(
            json["call-data-config"].map((x) => CallDataConfig.fromJson(x))),
        jobInfoConfigPast: Map.from(json["job-info-config-past"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        callAssignmentConfig:
            List<String>.from(json["call-assignment-config"].map((x) => x)),
        jobInfoConfigFuture:
            List<String>.from(json["job-info-config-future"].map((x) => x)),
        notesDocumentsConfig: json["notes-documents-config"],
        notificationConfig:
            NotificationConfig.fromJson(json["notification-config"]),
      );
}

class CallDataConfig {
  CallDataConfig({
    required this.name,
    required this.value,
  });

  String? name;
  String? value;

  factory CallDataConfig.fromJson(Map<String, dynamic> json) => CallDataConfig(
        name: json["name"],
        value: json["value"],
      );
}

class NotificationConfig {
  NotificationConfig({
    required this.email,
    required this.sms,
    required this.countryCode,
  });

  String? email;
  String? sms;
  String? countryCode;

  factory NotificationConfig.fromJson(Map<String, dynamic> json) =>
      NotificationConfig(
        email: json["email"],
        sms: json["sms"],
        countryCode: json["countryCode"],
      );
}

class EmployeeStatus {
  EmployeeStatus({
    required this.id,
    required this.name,
    required this.clientId,
    required this.priority,
    required this.ableToWork,
    required this.ableToLogin,
    required this.ableToAccessLogs,
    required this.blockJobNotifications,
    required this.blockMuaBookings,
    required this.lastOffer,
    required this.linkColor,
    required this.stewardsList,
    required this.seniorityAdj,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? id;
  String? name;
  String? clientId;
  String? priority;
  int? ableToWork;
  int? ableToLogin;
  int? ableToAccessLogs;
  int? blockJobNotifications;
  int? blockMuaBookings;
  int? lastOffer;
  String? linkColor;
  String? stewardsList;
  String? seniorityAdj;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory EmployeeStatus.fromJson(Map<String, dynamic> json) => EmployeeStatus(
        id: json["id"],
        name: json["name"],
        clientId: json["client_id"],
        priority: json["priority"],
        ableToWork: json["able_to_work"],
        ableToLogin: json["able_to_login"],
        ableToAccessLogs: json["able_to_access_logs"],
        blockJobNotifications: json["block_job_notifications"],
        blockMuaBookings: json["block_mua_bookings"],
        lastOffer: json["last_offer"],
        linkColor: json["link_color"],
        stewardsList: json["stewards_list"],
        seniorityAdj: json["seniority_adj"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );
}

class Phone {
  Phone({
    required this.id,
    required this.countryCode,
    required this.phoneableId,
    required this.phoneableType,
    required this.label,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  String? id;
  String? countryCode;
  String? phoneableId;
  String? phoneableType;
  String? label;
  int? phoneNumber;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        id: json["id"],
        countryCode: json["country_code"],
        phoneableId: json["phoneable_id"],
        phoneableType: json["phoneable_type"],
        label: json["label"],
        phoneNumber: json["phone_number"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}
