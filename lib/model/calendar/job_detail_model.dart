class JobDetailModel {
  String? id;
  int? jobNumber;
  String? employerRequests;
  int? employerRequestsPrivate;
  String? clientId;
  String? start;
  String? end;
  String? comment;
  CreatedBy? dispatchedBy;
  String? firstName;
  String? lastName;
  Employer? employer;
  dynamic payroll;
  Venue? venue;
  List<Calls>? calls;

  JobDetailModel({
    this.id,
    this.jobNumber,
    this.employerRequests,
    this.employerRequestsPrivate,
    this.clientId,
    this.start,
    this.end,
    this.comment,
    this.dispatchedBy,
    this.firstName,
    this.lastName,
    this.employer,
    this.payroll,
    this.venue,
    this.calls,
  });

  JobDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobNumber = json['job_number'];
    employerRequests = json['employer_requests'];
    employerRequestsPrivate = json["employer_requests_private"];
    start = json['start'];
    end = json['end'];
    comment = json['comment'];
    clientId = json['client_id'];
    dispatchedBy = json['dispatched_by'] != null
        ? CreatedBy.fromJson(json['dispatched_by'])
        : null;
    firstName = json['first_name'];
    lastName = json['last_name'];
    employer =
        json['employer'] != null ? Employer.fromJson(json['employer']) : null;
    payroll = json['payroll'];
    venue = Venue.fromJson(json['venue']);
    if (json['calls'] != null) {
      calls = <Calls>[];
      json['calls'].forEach((v) {
        calls!.add(Calls.fromJson(v));
      });
    }
  }
}

class Calls {
  String? id;
  // dynamic activity;
  String? employeeId;
  String? jobId;
  // dynamic offers;
  // int? rate;
  // dynamic responseToken;
  // String? skillId;
  // String? statusId;
  // dynamic attendanceStatusId;
  // String? calledAt;
  // String? createdAt;
  // String? updatedAt;
  // dynamic deletedAt;
  // String? end;
  // String? start;
  // String? markedAt;
  // String? notifiedAt;
  // String? assignedAt;
  // String? notes;
  // int? splitFlag;

  Calls({
    this.id,
    // this.activity,
    this.employeeId,
    this.jobId,
    // this.offers,
    // this.rate,
    // this.responseToken,
    // this.skillId,
    // this.statusId,
    // this.attendanceStatusId,
    // this.calledAt,
    // this.createdAt,
    // this.updatedAt,
    // this.deletedAt,
    // this.end,
    // this.start,
    // this.markedAt,
    // this.notifiedAt,
    // this.assignedAt,
    // this.notes,
    // this.splitFlag
  });

  Calls.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // activity = json['activity'];
    employeeId = json['employee_id'];
    jobId = json['job_id'];
    // offers = json['offers'];
    // rate = json['rate'];
    // responseToken = json['response_token'];
    // skillId = json['skill_id'];
    // statusId = json['status_id'];
    // attendanceStatusId = json['attendance_status_id'];
    // calledAt = json['called_at'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
    // end = json['end'];
    // start = json['start'];
    // markedAt = json['marked_at'];
    // notifiedAt = json['notified_at'];
    // assignedAt = json['assigned_at'];
    // notes = json['notes'];
    // splitFlag = json['split_flag'];
  }
}

class CreatedBy {
  String? id;
  String? firstName;
  String? lastName;

  CreatedBy({
    this.id,
    this.firstName,
    this.lastName,
  });

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }
}

class Employer {
  String? id;
  String? name;
  // String? email;
  // String? image;
  List<EmployerUsers>? employerUsers;

  Employer({
    this.id,
    this.name,
    // this.email,
    // this.image,
    this.employerUsers,
  });

  Employer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // email = json['email'];
    // image = json['image'];
    if (json['employer_users'] != null) {
      employerUsers = <EmployerUsers>[];
      json['employer_users'].forEach((v) {
        employerUsers!.add(EmployerUsers.fromJson(v));
      });
    }
  }
}

class EmployerUsers {
  String? id;
  // String? userId;
  User? user;

  EmployerUsers({
    this.id,
    // this.userId,
    this.user,
  });

  EmployerUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // userId = json['user_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  String? id;
  String? firstName;
  // String? lastName;

  User({
    this.id,
    this.firstName,
    // this.lastName,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    // lastName = json['last_name'];
  }
}

class Venue {
  String? id;
  String? name;
  List<Addresses>? addresses;

  Venue({
    this.id,
    this.name,
    this.addresses,
  });

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
  }
}

class Addresses {
  String? id;
  String? address;
  // String? addressableId;
  // String? addressableType;
  String? country;
  // String? municipality;
  // String? postcode;
  String? stateProvince;
  // int? status;
  // String? createdAt;
  // String? updatedAt;

  Addresses({
    this.id,
    this.address,
    // this.addressableId,
    // this.addressableType,
    this.country,
    // this.municipality,
    // this.postcode,
    this.stateProvince,
    // this.status,
    // this.createdAt,
    // this.updatedAt
  });

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    // addressableId = json['addressable_id'];
    // addressableType = json['addressable_type'];
    country = json['country'];
    // municipality = json['municipality'];
    // postcode = json['postcode'];
    stateProvince = json['state_province'];
    // status = json['status'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }
}
