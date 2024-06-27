import 'package:json_annotation/json_annotation.dart';
part 'exercises.g.dart';

@JsonSerializable()
class Exercises {
  const Exercises({
    required this.howto,
    required this.description,
    required this.type,
    required this.title,
  });

  final String? title;
  final String? howto;
  final String? description;
  final String? type;

  factory Exercises.fromJson(Map<String, dynamic> json) =>
      _$ExercisesFromJson(json);

  Map<String, dynamic> toJson() => _$ExercisesToJson(this);
}
