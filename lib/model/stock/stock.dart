import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

@JsonSerializable()
class Stock {
  final int id;
  final String name;
  final String color;
  final String tag;
  final List<Map<String, dynamic>> criteria;

  Stock({
    required this.id,
    required this.name,
    required this.color,
    required this.tag,
    required this.criteria,
  });

  factory Stock.fromJson(Map<String, dynamic> json) =>
      _$StockFromJson(json);

  Map<String, dynamic> toJson() => _$StockToJson(this);
}
