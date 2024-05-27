// Due to an unusual data parsing issue, unused classes and objects have been commented out.

class VacationHistoryModel {
  VacationHistoryModel({
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

  factory VacationHistoryModel.fromJson(Map<String, dynamic> json) =>
      VacationHistoryModel(
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
