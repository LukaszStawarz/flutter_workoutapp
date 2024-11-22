import 'package:json_annotation/json_annotation.dart';
part 'warmup.g.dart';

@JsonSerializable()
class WarmUp {
  const WarmUp(
    this.howto,
    this.description,
    this.videourl, {
    required this.title,
  });

  final String title;
  final String howto;
  final String description;
  final String videourl;

  factory WarmUp.fromJson(Map<String, dynamic> json) => _$WarmUpFromJson(json);

  Map<String, dynamic> toJson() => _$WarmUpToJson(this);
}
