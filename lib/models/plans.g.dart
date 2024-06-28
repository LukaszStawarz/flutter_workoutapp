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
      (json['wk_ex1'] as List<dynamic>).map((e) => e as String).toList(),
      (json['wk_ex2'] as List<dynamic>).map((e) => e as String).toList(),
      (json['wk_ex3'] as List<dynamic>).map((e) => e as String).toList(),
      json['time1'] as String,
      json['time2'] as String,
      json['time3'] as String,
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
      'wk_ex1': instance.wk_ex1,
      'wk_ex2': instance.wk_ex2,
      'wk_ex3': instance.wk_ex3,
      'time1': instance.time1,
      'time2': instance.time2,
      'time3': instance.time3,
    };
