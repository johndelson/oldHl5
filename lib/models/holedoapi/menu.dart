import 'package:holedo/models/models.dart';

class Menu extends Model {
  int? id;
  dynamic parentId;
  String? slug;
  String? title;
  List<Menu>? children;

  Menu({this.id, this.parentId, this.slug, this.title, this.children});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json['id'] as int?,
        parentId: json['parent_id'] as dynamic,
        slug: json['slug'] as String?,
        title: json['title'] as String?,
        children: (json['children'] as List<dynamic>?)
            ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'parent_id': parentId,
        'slug': slug,
        'title': title,
        'children': children?.map((e) => e.toJson()).toList(),
      };
}
