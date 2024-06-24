import 'package:json_annotation/json_annotation.dart';
part 'breathing.g.dart';

@JsonSerializable()
class Breathing {
  const Breathing(
    this.howto,
    this.description, {
    required this.title,
  });

  final String title;
  final String howto;
  final String description;

  factory Breathing.fromJson(Map<String, dynamic> json) =>
      _$BreathingFromJson(json);

  Map<String, dynamic> toJson() => _$BreathingToJson(this);
}
