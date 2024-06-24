// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cardio _$CardioFromJson(Map<String, dynamic> json) => Cardio(
      json['howto'] as String,
      json['description'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$CardioToJson(Cardio instance) => <String, dynamic>{
      'title': instance.title,
      'howto': instance.howto,
      'description': instance.description,
    };
