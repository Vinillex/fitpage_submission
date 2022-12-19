import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../model/api_failure.dart';
import '../model/stock/stock.dart';

class StockService {
  StockService(this._dio);
  final Dio _dio;

  Future<Either<List<Stock>, ApiFailure>> requestStockList() async {
    try {
      List<Stock> stockList = [];
      final response = await _dio.get("http://coding-assignment.bombayrunning.com/data.json");
      if (response.statusCode == 200) {
        final snapshots = response.data as List<dynamic>;
        stockList = snapshots
            .map((snapshot) => Stock.fromJson(snapshot))
            .toList();

        return left(stockList);
      }
      return right(
        ApiFailure(),
      );
    } on SocketException {
      return right(
        ApiFailure(
          'No Internet',
        ),
      );
    }
  }
}
