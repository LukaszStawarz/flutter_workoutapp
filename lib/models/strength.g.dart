// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strength.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Strength _$StrengthFromJson(Map<String, dynamic> json) => Strength(
      json['howto'] as String,
      json['description'] as String,
      json['videourl'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$StrengthToJson(Strength instance) => <String, dynamic>{
      'title': instance.title,
      'howto': instance.howto,
      'description': instance.description,
      'videourl': instance.videourl,
    };
