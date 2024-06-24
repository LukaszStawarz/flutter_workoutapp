import 'package:json_annotation/json_annotation.dart';
part 'yoga.g.dart';

@JsonSerializable()
class Yoga {
  const Yoga(
    this.howto,
    this.description, {
    required this.title,
  });

  final String title;
  final String howto;
  final String description;

  factory Yoga.fromJson(Map<String, dynamic> json) => _$YogaFromJson(json);

  Map<String, dynamic> toJson() => _$YogaToJson(this);
}
