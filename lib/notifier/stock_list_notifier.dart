import 'package:fitpage_submission/utility/dependency_manager.dart';
import 'package:fitpage_submission/model/stock/stock.dart';
import 'package:fitpage_submission/service/stock_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common_widgets/failure_snackbar.dart';

final stockListNotifier = StateNotifierProvider.autoDispose<
    StockListNotifier, AsyncValue<List<Stock>>>(
      (ref) {
    return StockListNotifier(stockService);
  },
);

class StockListNotifier extends StateNotifier<AsyncValue<List<Stock>>> {
  final StockService stockService;

  StockListNotifier(this.stockService) : super(AsyncValue.loading());

  Future requestStockListData() async {
    final status = await stockService.requestStockList();
    status.fold(
          (success) {
        state = AsyncValue.data(success);
      },
          (error) {
        showFailureSnackBar(error);
        state = AsyncValue.error(error);
      },
    );
  }
}
