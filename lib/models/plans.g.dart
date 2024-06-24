// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      json['imageURL'] as String,
      json['image_easy'] as String,
      json['image_med'] as String,
      json['image_hard'] as String,
      json['wk_plan1'] as String,
      json['wk_plan2'] as String,
      json['wk_plan3'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'title': instance.title,
      'imageURL': instance.imageURL,
      'image_easy': instance.image_easy,
      'image_med': instance.image_med,
      'image_hard': instance.image_hard,
      'wk_plan1': instance.wk_plan1,
      'wk_plan2': instance.wk_plan2,
      'wk_plan3': instance.wk_plan3,
    };
