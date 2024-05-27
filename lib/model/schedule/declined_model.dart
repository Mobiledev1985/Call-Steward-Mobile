// Due to an unusual data parsing issue, unused classes and objects have been commented out.

class DeclinedModel {
  String? id;
  // String? callId;
  // String? employeeId;
  // String? statusId;
  String? createdAt;
  // String? updatedAt;
  // dynamic deletedAt;
  // String? effector;
  // String? initiator;
  // String? firstName;
  // String? lastName;
  Call? call;
  Status? status;

  DeclinedModel(
      {this.id,
      // this.callId,
      // this.employeeId,
      // this.statusId,
      this.createdAt,
      // this.updatedAt,
      // this.deletedAt,
      // this.effector,
      // this.initiator,
      // this.firstName,
      // this.lastName,
      this.call,
      this.status});

  DeclinedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // callId = json['call_id'];
    // employeeId = json['employee_id'];
    // statusId = json['status_id'];
    createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
    // effector = json['effector'];
    // initiator = json['initiator'];
    // firstName = json['first_name'];
    // lastName = json['last_name'];
    call = json['call'] != null ? Call.fromJson(json['call']) : null;
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
}

class Call {
  String? id;
  // dynamic activity;
  // String? employeeId;
  // String? jobId;
  // dynamic offers;
  // num? rate;
  // dynamic responseToken;
  // String? skillId;
  // String? statusId;
  // dynamic attendanceStatusId;
  // String? calledAt;
  // String? createdAt;
  // String? updatedAt;
  // String? deletedAt;
  DateTime? end;
  DateTime? start;
  // dynamic markedAt;
  // dynamic notifiedAt;
  // String? assignedAt;

  // int? splitFlag;
  Job? job;
  Skill? skill;

  Call(
      {this.id,
      // this.activity,
      // this.employeeId,
      // this.jobId,
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
      this.end,
      this.start,
      // this.markedAt,
      // this.notifiedAt,
      // this.assignedAt,
      // this.splitFlag,
      this.job,
      this.skill});

  Call.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // activity = json['activity'];
    // employeeId = json['employee_id'];
    // jobId = json['job_id'];
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
    end = DateTime.parse(json['end']);
    start = DateTime.parse(json['start']);
    // markedAt = json['marked_at'];
    // notifiedAt = json['notified_at'];
    // assignedAt = json['assigned_at'];

    // splitFlag = json['split_flag'];
    job = json['job'] != null ? Job.fromJson(json['job']) : null;
    skill = json['skill'] != null ? Skill.fromJson(json['skill']) : null;
  }
}

class Job {
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
  Client? client;

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
  // List<void>? report;

  Job({
    this.id,
    // this.jobNumber,
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
    this.client,
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
    // this.rateId,
    // this.report
  });

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // jobNumber = json['job_number'];
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
    client = json["client"] == null ? null : Client.fromJson(json['client']);

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

class Client {
  String? subdomain;
  String? contactPerson;

  Client({this.subdomain, this.contactPerson});

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        subdomain: json['subdomain'],
        contactPerson: json['contact_person'],
      );
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
