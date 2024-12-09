// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPlan _$UserPlanFromJson(Map<String, dynamic> json) => UserPlan(
      json['planTitle'] as String,
      json['description'] as String,
      (json['exerciseIds'] as List<dynamic>).map((e) => e as String).toList(),
      json['userId'] as String,
    );

Map<String, dynamic> _$UserPlanToJson(UserPlan instance) => <String, dynamic>{
      'planTitle': instance.planTitle,
      'description': instance.description,
      'exerciseIds': instance.exerciseIds,
      'userId': instance.userId,
    };
