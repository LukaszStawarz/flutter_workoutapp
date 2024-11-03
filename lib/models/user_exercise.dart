import 'package:json_annotation/json_annotation.dart';

part 'user_exercise.g.dart';

@JsonSerializable(explicitToJson: true)
class UserExercise {
  final DateTime startDate;
  final String planId;
  final int subPlanIndex;
  final List<SubExercise> subExercises;
  final String userId;

  factory UserExercise.fromJson(Map<String, dynamic> json) =>
      _$UserExerciseFromJson(json);

  UserExercise(
    this.startDate,
    this.planId,
    this.subPlanIndex,
    this.subExercises,
    this.userId,
  );

  Map<String, dynamic> toJson() => _$UserExerciseToJson(this);
}

@JsonSerializable()
class SubExercise {
  final int subExerciseIndex;
  final bool wasSkipped;
  final int duration;

  SubExercise({
    required this.subExerciseIndex,
    required this.wasSkipped,
    required this.duration,
  });

  factory SubExercise.fromJson(Map<String, dynamic> json) =>
      _$SubExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$SubExerciseToJson(this);
}
