// Due to an unusual data parsing issue, unused classes and objects have been commented out.

class GetEmployeevacations {
  GetEmployeevacations({
    this.statusCode,
    this.statusMessage,
    this.vacations,
  });

  String? statusCode;
  String? statusMessage;
  Vacation? vacations;

  factory GetEmployeevacations.fromJson(Map<String, dynamic> json) =>
      GetEmployeevacations(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        vacations: Vacation.fromJson(json["result"]),
      );
}

class Vacation {
  Vacation({
    required this.running,
    required this.upcoming,
  });

  List<Ing> running;
  List<Ing> upcoming;

  factory Vacation.fromJson(Map<String, dynamic> json) => Vacation(
        running: List<Ing>.from(json["running"].map((x) => Ing.fromJson(x))),
        upcoming: List<Ing>.from(json["upcoming"].map((x) => Ing.fromJson(x))),
      );
}

class Ing {
  Ing({
    required this.id,
    required this.label,
    // required this.vacationableId,
    // required this.vacationableType,
    required this.start,
    required this.end,
    // required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
  });

  String id;
  String label;
  // String vacationableId;
  // String vacationableType;
  DateTime start;
  DateTime end;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;

  factory Ing.fromJson(Map<String, dynamic> json) => Ing(
        id: json["id"],
        label: json["label"],
        // vacationableId: json["vacationable_id"],
        // vacationableType: json["vacationable_type"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
      );
}
