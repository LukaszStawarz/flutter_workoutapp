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
    this.wk_plan3,
    this.wk_ex1,
    this.wk_ex2,
    this.wk_ex3,
    this.time1,
    this.time2,
    this.time3, {
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
  final List<String> wk_ex1;
  final List<String> wk_ex2;
  final List<String> wk_ex3;
  final String time1;
  final String time2;
  final String time3;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
