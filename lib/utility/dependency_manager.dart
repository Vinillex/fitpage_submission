import 'package:dio/dio.dart';
import 'package:fitpage_submission/service/stock_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void registerDependencies() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<StockService>(StockService(dioProvider));
}

final stockService = getIt.get<StockService>();
final dioProvider = getIt.get<Dio>();