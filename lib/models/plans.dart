import 'package:json_annotation/json_annotation.dart';
part 'plans.g.dart';

@JsonSerializable()
class Plan {
  const Plan(
    this.imageURL,
    this.image_easy,
    this.image_med,
    this.image_hard,
    this.wk_plan1,
    this.wk_plan2,
    this.wk_plan3, {
    required this.title,
  });

  final String title;
  final String imageURL;
  final String image_easy;
  final String image_med;
  final String image_hard;
  final String wk_plan1;
  final String wk_plan2;
  final String wk_plan3;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
