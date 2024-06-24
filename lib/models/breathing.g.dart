// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breathing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breathing _$BreathingFromJson(Map<String, dynamic> json) => Breathing(
      json['howto'] as String,
      json['description'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$BreathingToJson(Breathing instance) => <String, dynamic>{
      'title': instance.title,
      'howto': instance.howto,
      'description': instance.description,
    };
