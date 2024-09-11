class Workshop {
  Workshop({
    required this.id,
    required this.userId,
    required this.workshopName,
    required this.ownerName,
    required this.address,
    required this.description,
    required this.primaryNumber,
    required this.secondaryNumber,
    required this.whatsappNumber,
    required this.email,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  int? id;
  int? userId;
  String? workshopName;
  String? ownerName;
  String? address;
  String? description;
  String? primaryNumber;
  String? secondaryNumber;
  String? whatsappNumber;
  String? email;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Workshop.fromJson(Map<String, dynamic> json) => Workshop(
        id: json["id"],
        userId: json["user_id"],
        workshopName: json["workshop_name"],
        ownerName: json["owner_name"],
        address: json["address"],
        description: json["description"],
        primaryNumber: json["primary_number"],
        secondaryNumber: json["secondary_number"],
        whatsappNumber: json["whatsapp_number"],
        email: json["email"],
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "workshop_name": workshopName,
        "owner_name": ownerName,
        "address": address,
        "description": description,
        "primary_number": primaryNumber,
        "secondary_number": secondaryNumber,
        "whatsapp_number": whatsappNumber,
        "email": email,
        "deleted_at": deletedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
