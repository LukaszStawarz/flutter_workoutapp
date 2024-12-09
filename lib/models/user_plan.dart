import 'package:json_annotation/json_annotation.dart';
part 'user_plan.g.dart';

@JsonSerializable()
class UserPlan {
  UserPlan(
    this.planTitle,
    this.description,
    this.exerciseIds,
    this.userId,
  );

  final String planTitle;
  final String description;
  final List<String> exerciseIds;
  final String userId;

  factory UserPlan.fromJson(Map<String, dynamic> json) =>
      _$UserPlanFromJson(json);

  Map<String, dynamic> toJson() => _$UserPlanToJson(this);
}
