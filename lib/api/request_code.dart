class ApiEndPoints {
  //define which api you want to call

  //Auth APIs
  static const String login = "auth/login";
  static const String socialLogin = "auth/socialLogin";
  static const String appleLogin = "auth/appleLogin";
  static const String forgotPassword = "auth/forgotPassword";
  static const String forgotPasswordWithSMSCode = "auth/2FAlogin";
  static const String verifyOtp = "auth/validate2FACode";
  static const String resetPassword = "auth/resetPassword";
  static const String logout = "logout";

  //Employee APIs
  static const String employee = "employee/";
  static const String client = "client/";
  static const String getEmployeesAssociation = "/getEmployeesAssociation";
  static const String getMUAEmployees = "getMUAEmployees";
  static const String checkSkill = "/checkSkill";
  static const String notifyLog = "${employee}notifyLog";
  static const String checkUserSubscriptionStatus =
      "/checkUserSubscriptionStatus";
  static const String changeDateFormat = "${employee}changeDateFormat";
  static const String appNotificationSettings =
      "${employee}appNotificationSettings";
  static const String emailNotificationSettings =
      "${employee}emailNotificationSettings";
  static const String smsNotificationSettings =
      "${employee}smsNotificationSettings";
  static const String stopNotificationSettings =
      "${employee}stopNotificationSettings";
  static const String updateMailingList = "/updateMailingList";
  static const String changeWishlistStatus = "${employee}changeWishlistStatus";
  static const String wishlist = "/wishlist";
  static const String ignorelist = "/ignorelist";
  static const String updateMyAvailibility = "${employee}updateMyAvailibility";
  static const String wishlistmobile = "/wishlistmobile";
  static const String ignorelistmobile = "/ignorelistmobile";

  //Skills APIs
  static const String getSkills = "skill/getAllSkills";

  //attachment
  static const String attachmentSigleFile = "attachment/uploadSingleFile";

  //vacation
  static const String vacation = "vacation";
  static const String getEmployeevacations = "$vacation/getEmployeevacations";
  static const String getEmployeeVacationHistory =
      "$vacation/getEmployeeVacationHistory";

  //call
  static const String call = "call";
  static const String actionLog = "$call/actionLog";
  static const String employeeCallsByNext45Days =
      "$call/employeeCallsByNext45Days";
  static const String employeeDeclinedCallsByNext45 =
      "$call/employeeDeclinedCallsByNext45";
  static const String employeeCallsByMonth = "$call/employeeCallsByMonth";
  static const String employeeDeclinedCallsByMonth =
      "$call/employeeDeclinedCallsByMonth";
  static const String confirm = "/confirm";
  static const String pass = "/pass";
  static const String decline = "/decline";

  ///job
  static const String job = "job/";
  static const String calendarJobs = "${job}calendarJobs";
  static const String getWishlistStatus = "${job}getWishlistStatus";
  static const String employeeJobNotInWishlist =
      "${job}employeeJobNotInWishlist";
}
