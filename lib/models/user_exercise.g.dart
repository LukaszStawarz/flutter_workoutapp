// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserExercise _$UserExerciseFromJson(Map<String, dynamic> json) => UserExercise(
      DateTime.parse(json['startDate'] as String),
      json['planId'] as String,
      (json['subPlanIndex'] as num).toInt(),
      (json['subExercises'] as List<dynamic>)
          .map((e) => SubExercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['userId'] as String,
    );

Map<String, dynamic> _$UserExerciseToJson(UserExercise instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'planId': instance.planId,
      'subPlanIndex': instance.subPlanIndex,
      'subExercises': instance.subExercises.map((e) => e.toJson()).toList(),
      'userId': instance.userId,
    };

SubExercise _$SubExerciseFromJson(Map<String, dynamic> json) => SubExercise(
      subExerciseIndex: (json['subExerciseIndex'] as num).toInt(),
      wasSkipped: json['wasSkipped'] as bool,
      duration: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$SubExerciseToJson(SubExercise instance) =>
    <String, dynamic>{
      'subExerciseIndex': instance.subExerciseIndex,
      'wasSkipped': instance.wasSkipped,
      'duration': instance.duration,
    };
