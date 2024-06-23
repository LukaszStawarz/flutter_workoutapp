// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      json['imageURL'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'title': instance.title,
      'imageURL': instance.imageURL,
    };
