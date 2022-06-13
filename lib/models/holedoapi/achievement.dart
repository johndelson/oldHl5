import 'achievement_type.dart';

class Achievement {
  int? id;
  int? userId;
  int? achievementTypeId;
  String? title;
  String? issuingEntity;
  String? website;
  DateTime? dateReceived;
  dynamic description;
  DateTime? created;
  DateTime? modified;
  AchievementType? achievementType;
  String? dateIssued;

  Achievement({
    this.id,
    this.userId,
    this.achievementTypeId,
    this.title,
    this.issuingEntity,
    this.website,
    this.dateReceived,
    this.description,
    this.created,
    this.modified,
    this.achievementType,
    this.dateIssued,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        achievementTypeId: json['achievement_type_id'] as int?,
        title: json['title'] as String?,
        issuingEntity: json['issuing_entity'] as String?,
        website: json['website'] as String?,
        dateReceived: json['date_received'] == null
            ? null
            : DateTime.parse(json['date_received'] as String),
        description: json['description'] as dynamic,
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
        modified: json['modified'] == null
            ? null
            : DateTime.parse(json['modified'] as String),
        achievementType: json['achievement_type'] == null
            ? null
            : AchievementType.fromJson(
                json['achievement_type'] as Map<String, dynamic>),
        dateIssued: json['date_issued'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'achievement_type_id': achievementTypeId,
        'title': title,
        'issuing_entity': issuingEntity,
        'website': website,
        'date_received': dateReceived?.toIso8601String(),
        'description': description,
        'created': created?.toIso8601String(),
        'modified': modified?.toIso8601String(),
        'achievement_type': achievementType?.toJson(),
        'date_issued': dateIssued,
      };
}