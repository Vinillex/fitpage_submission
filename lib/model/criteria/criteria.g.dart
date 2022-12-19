// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criteria.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Criteria _$CriteriaFromJson(Map<String, dynamic> json) => Criteria(
      type: json['type'] as String,
      text: json['text'] as String,
      variable: json['variable'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CriteriaToJson(Criteria instance) => <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'variable': instance.variable,
    };
