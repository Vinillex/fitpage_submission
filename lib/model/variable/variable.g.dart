// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variable _$VariableFromJson(Map<String, dynamic> json) => Variable(
      type: json['type'] as String,
      study_type: json['study_type'] as String?,
      parameter_name: json['parameter_name'] as String?,
      min_value: json['min_value'] as int?,
      max_value: json['max_value'] as int?,
      default_value: json['default_value'] as int?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$VariableToJson(Variable instance) => <String, dynamic>{
      'type': instance.type,
      'study_type': instance.study_type,
      'parameter_name': instance.parameter_name,
      'min_value': instance.min_value,
      'max_value': instance.max_value,
      'default_value': instance.default_value,
      'values': instance.values,
    };
