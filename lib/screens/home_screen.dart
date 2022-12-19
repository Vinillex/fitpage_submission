import 'package:auto_route/auto_route.dart';
import 'package:fitpage_submission/notifier/stock_list_notifier.dart';
import 'package:fitpage_submission/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() async {
      await requestStockScreenData();
    });
    super.initState();
  }

  Future<void> requestStockScreenData() async {
    await ref.read(stockListNotifier.notifier).requestStockListData();
  }

  @override
  Widget build(BuildContext context) {
    final stockListState = ref.watch(stockListNotifier);
    return Scaffold(
      backgroundColor: Color(0xFF01131B),
      appBar: AppBar(
        title: Text(
          'Stock Screener',
        ),
      ),
      body: stockListState.when(
        data: (data) {
          return ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(data[i].name),
                subtitle: Text(
                  data[i].tag,
                  style: TextStyle(
                    color:
                        (data[i].color == 'green') ? Color(0xFF34B71F) : Color(0xFFF3393F),

                ),
                ),
                onTap: () {
                  context.router.push(CriteriaRoute(stock: data[i]));
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.white,
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
              );
            },
          );
        },
        error: (e, _) {
          return Center(
            child: Text('Error'),
          );
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
