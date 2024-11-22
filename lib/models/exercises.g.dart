// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercises _$ExercisesFromJson(Map<String, dynamic> json) => Exercises(
      howto: json['howto'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      videourl: json['videourl'] as String,
    );

Map<String, dynamic> _$ExercisesToJson(Exercises instance) => <String, dynamic>{
      'title': instance.title,
      'howto': instance.howto,
      'description': instance.description,
      'type': instance.type,
      'videourl': instance.videourl,
    };
