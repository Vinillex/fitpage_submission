import 'package:json_annotation/json_annotation.dart';

part 'criteria.g.dart';

@JsonSerializable()
class Criteria {
  final String type;
  final String text;
  final Map<String, dynamic>? variable;

  Criteria({
    required this.type,
    required this.text,
    this.variable,
  });

  factory Criteria.fromJson(Map<String, dynamic> json) =>
      _$CriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$CriteriaToJson(this);
}
