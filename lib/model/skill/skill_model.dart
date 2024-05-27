import 'package:get/get.dart';
// Due to an unusual data parsing issue, unused classes and objects have been commented out.

class SkillModel {
  SkillModel({
    this.statusCode,
    this.statusMessage,
    this.result,
  });

  String? statusCode;
  String? statusMessage;
  RxList<Result>? result;

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        result:
            RxList<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    required this.id,
    // required this.clientId,
    // required this.description,
    required this.name,
    // required this.archived,
    required this.createdAt,
    // required this.updatedAt,
    // this.deletedAt,
    required this.priotiy,
    // required this.skillRates,
    this.seniority,
    required this.isSelected,
    required this.isMandatorySkill,
  });

  String? id;
  // String? clientId;
  // String? description;
  String? name;
  // int archived;
  DateTime? createdAt;

  int? priotiy;
  // List<SkillRate> skillRates;
  bool isSelected;

  /// This will assign value based on skill id in my_profile_controller
  String? seniority;
  bool isMandatorySkill;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        // clientId: json["client_id"],
        // description: json["description"],
        name: json["name"] ?? "",
        // archived: json["archived"],
        createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        priotiy: json["priotiy"],
        // skillRates: List<SkillRate>.from(
        //     json["skill_rates"].map((x) => SkillRate.fromJson(x))),
        isSelected: false,
        isMandatorySkill: false,
      );
}

class SkillRate {
  SkillRate({
    required this.id,
    required this.skillId,
    required this.rateId,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String skillId;
  String rateId;
  double amount;
  DateTime createdAt;
  DateTime updatedAt;

  factory SkillRate.fromJson(Map<String, dynamic> json) => SkillRate(
        id: json["id"],
        skillId: json["skill_id"],
        rateId: json["rate_id"],
        amount: json["amount"]?.toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "skill_id": skillId,
        "rate_id": rateId,
        "amount": amount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
