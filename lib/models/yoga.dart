import 'package:json_annotation/json_annotation.dart';
part 'yoga.g.dart';

@JsonSerializable()
class Yoga {
  const Yoga(
    this.howto,
    this.description,
    this.videourl, {
    required this.title,
  });

  final String title;
  final String howto;
  final String description;
  final String videourl;

  factory Yoga.fromJson(Map<String, dynamic> json) => _$YogaFromJson(json);

  Map<String, dynamic> toJson() => _$YogaToJson(this);
}
