// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warmup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarmUp _$WarmUpFromJson(Map<String, dynamic> json) => WarmUp(
      json['howto'] as String,
      json['description'] as String,
      json['videourl'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$WarmUpToJson(WarmUp instance) => <String, dynamic>{
      'title': instance.title,
      'howto': instance.howto,
      'description': instance.description,
      'videourl': instance.videourl,
    };
