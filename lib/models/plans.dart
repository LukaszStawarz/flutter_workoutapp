import 'package:json_annotation/json_annotation.dart';
part 'plans.g.dart';

@JsonSerializable()
class Plan {
  const Plan(
    this.imageURL, {
    required this.title,
  });

  final String title;
  final String imageURL;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
