import 'package:holedo/models/models.dart';

class GivenReference extends Model {
  int? id;
  int? userId;
  int? authorId;
  String? testimonial;
  String? requestMessage;
  dynamic modificationMessage;
  int? status;
  String? created;
  String? modified;

  GivenReference({
    this.id,
    this.userId,
    this.authorId,
    this.testimonial,
    this.requestMessage,
    this.modificationMessage,
    this.status,
    this.created,
    this.modified,
  });

  factory GivenReference.fromJson(Map<String, dynamic> json) {
    return GivenReference(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      authorId: json['author_id'] as int?,
      testimonial: json['testimonial'] as String?,
      requestMessage: json['request_message'] as String?,
      modificationMessage: json['modification_message'] as dynamic,
      status: json['status'] as int?,
      created: json['created'] as String?,
      modified: json['modified'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'author_id': authorId,
        'testimonial': testimonial,
        'request_message': requestMessage,
        'modification_message': modificationMessage,
        'status': status,
        'created': created,
        'modified': modified,
      };
}
