import 'package:json_annotation/json_annotation.dart';
part 'strength.g.dart';

@JsonSerializable()
class Strength {
  const Strength(
    this.howto,
    this.description, {
    required this.title,
  });

  final String title;
  final String howto;
  final String description;

  factory Strength.fromJson(Map<String, dynamic> json) =>
      _$StrengthFromJson(json);

  Map<String, dynamic> toJson() => _$StrengthToJson(this);
}
