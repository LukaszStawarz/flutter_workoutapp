// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subplan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubPlan _$SubPlanFromJson(Map<String, dynamic> json) => SubPlan(
      json['image'] as String,
      index: (json['index'] as num).toInt(),
      planTitle: json['planTitle'] as String,
      exercises:
          (json['exercises'] as List<dynamic>).map((e) => e as String).toList(),
      time: json['time'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$SubPlanToJson(SubPlan instance) => <String, dynamic>{
      'index': instance.index,
      'planTitle': instance.planTitle,
      'exercises': instance.exercises,
      'time': instance.time,
      'description': instance.description,
      'image': instance.image,
    };
