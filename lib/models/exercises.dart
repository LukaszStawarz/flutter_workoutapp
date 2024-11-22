import 'package:json_annotation/json_annotation.dart';
part 'exercises.g.dart';

@JsonSerializable()
class Exercises {
  Exercises({
    required this.howto,
    required this.description,
    required this.type,
    required this.title,
    required this.videourl,
    this.id,
  });

  final String title;
  final String howto;
  final String description;
  final String type;
  final String videourl;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? id = '';

  factory Exercises.fromJson(Map<String, dynamic> json) =>
      _$ExercisesFromJson(json);

  Map<String, dynamic> toJson() => _$ExercisesToJson(this);
}
