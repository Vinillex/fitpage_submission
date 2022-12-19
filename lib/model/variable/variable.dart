import 'package:json_annotation/json_annotation.dart';

part 'variable.g.dart';

@JsonSerializable()
class Variable {
  final String type;
  final String? study_type;
  final String? parameter_name;
  final int? min_value;
  final int? max_value;
  final int? default_value;
  final List<double>? values;

  Variable({
    required this.type,
    this.study_type,
    this.parameter_name,
    this.min_value,
    this.max_value,
    this.default_value,
    this.values,
  });

  factory Variable.fromJson(Map<String, dynamic> json) =>
      _$VariableFromJson(json);

  Map<String, dynamic> toJson() => _$VariableToJson(this);
}
