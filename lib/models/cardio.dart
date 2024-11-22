import 'package:json_annotation/json_annotation.dart';
part 'cardio.g.dart';

@JsonSerializable()
class Cardio {
  const Cardio(
    this.howto,
    this.description,
    this.videourl, {
    required this.title,
  });

  final String title;
  final String howto;
  final String description;
  final String videourl;

  factory Cardio.fromJson(Map<String, dynamic> json) => _$CardioFromJson(json);

  Map<String, dynamic> toJson() => _$CardioToJson(this);
}
