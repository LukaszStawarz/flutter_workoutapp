import 'package:json_annotation/json_annotation.dart';
part 'strength.g.dart';

@JsonSerializable()
class Strength {
  const Strength(
    this.howto,
    this.description,
    this.videourl, {
    required this.title,
  });

  final String title;
  final String howto;
  final String description;
  final String videourl;

  factory Strength.fromJson(Map<String, dynamic> json) =>
      _$StrengthFromJson(json);

  Map<String, dynamic> toJson() => _$StrengthToJson(this);
}
