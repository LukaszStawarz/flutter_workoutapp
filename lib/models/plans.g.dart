// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      title: json['title'] as String,
      dashboardImageUrl: json['dashboardImageUrl'] as String,
      subplan: (json['subplan'] as List<dynamic>)
          .map((e) => SubPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'title': instance.title,
      'dashboardImageUrl': instance.dashboardImageUrl,
      'subplan': instance.subplan.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };
