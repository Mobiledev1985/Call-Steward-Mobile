class EmployeeAssociationModel {
  EmployeeAssociationModel({
    required this.clientId,
    required this.subdomain,
    required this.contactPerson,
  });

  String clientId;
  String subdomain;
  String contactPerson;

  factory EmployeeAssociationModel.fromJson(Map<String, dynamic> json) =>
      EmployeeAssociationModel(
        clientId: json["client_id"],
        subdomain: json["subdomain"],
        contactPerson: json["contact_person"],
      );

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "subdomain": subdomain,
        "contact_person": contactPerson,
      };
}
