import 'package:fitpage_submission/notifier/stock_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/criteria/criteria.dart';
import '../model/stock/stock.dart';
import '../widgets/details_screen_widgets/criteria_list_tile.dart';

class CriteriaScreen extends StatelessWidget {
  final Stock stock;
  const CriteriaScreen({Key? key, required this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Criteria> criteriaList =
    stock.criteria.map((e) => Criteria.fromJson(e)).toList();
    return Scaffold(
      backgroundColor: Color(0xFF01131B),
      appBar: AppBar(
        title: const Text(
          'Criteria Screen',
        ),
      ),
      body: Column(
        children: [
          ListTile(
            tileColor: Color(0xFF1686B0),
            title: Text(stock.name),
            subtitle: Text(
              stock.tag,
              style: TextStyle(
                color: (stock.color == 'green')
                    ? Color(0xFF34B71F)
                    : Color(0xFFF3393F),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, i) {
                return CriteriaListTile(
                  criteria: criteriaList[i],
                );
              },
              separatorBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'and',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                );
              },
              itemCount: criteriaList.length,
            ),
          ),
        ],
      ),
    );
  }
}