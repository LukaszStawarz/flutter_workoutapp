// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Yoga _$YogaFromJson(Map<String, dynamic> json) => Yoga(
      json['howto'] as String,
      json['description'] as String,
      json['videourl'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$YogaToJson(Yoga instance) => <String, dynamic>{
      'title': instance.title,
      'howto': instance.howto,
      'description': instance.description,
      'videourl': instance.videourl,
    };
