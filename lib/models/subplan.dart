import 'package:gymapp/models/exercises.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subplan.g.dart';

@JsonSerializable()
class SubPlan {
  final int index;
  final String planTitle;
  final List<String> exercises;
  final String time;
  final String description;
  final String image;

  SubPlan(
    this.image, {
    required this.index,
    required this.planTitle,
    required this.exercises,
    required this.time,
    required this.description,
  });
  // List<Exercises> get exerciseObjects =>
  //     exercises.map((e) => Exercises.fromJson(e)).toList();
  factory SubPlan.fromJson(Map<String, dynamic> json) =>
      _$SubPlanFromJson(json);

  Map<String, dynamic> toJson() => _$SubPlanToJson(this);
}
