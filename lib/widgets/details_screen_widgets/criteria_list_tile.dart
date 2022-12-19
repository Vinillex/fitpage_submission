import 'package:auto_route/auto_route.dart';
import 'package:fitpage_submission/model/criteria/criteria.dart';
import 'package:fitpage_submission/model/variable/variable.dart';
import 'package:fitpage_submission/router/app_router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CriteriaListTile extends StatefulWidget {
  final Criteria criteria;

  const CriteriaListTile({Key? key, required this.criteria}) : super(key: key);

  @override
  State<CriteriaListTile> createState() => _CriteriaListTileState();
}

class _CriteriaListTileState extends State<CriteriaListTile> {
  List<Widget> widgetList = [];

  @override
  void initState() {
    if (widget.criteria.type == 'variable') {
      createWidgetList();
    }
    super.initState();
  }

  void pushChangesScreen(Variable variable) {
    context.router.push(
      VariableRoute(variable: variable),
    );
  }

  void createWidgetList() {
    final keyList = widget.criteria.variable?.keys.toList();
    String textString = widget.criteria.text;
    List<String> stringList = [];
    keyList?.forEach((element) {
      Variable variable = Variable.fromJson(widget.criteria.variable![element]);
      stringList = textString.split(element);
      textString = stringList.last;
      widgetList.add(Text(
        stringList[0],
      ));
      if (variable.type == 'value') {
        widgetList.add(GestureDetector(
          onTap: () {
            context.router.push(VariableRoute(variable: variable));
          },
          child: Text(
            '(${variable.values![0]})',
            style: const TextStyle(color: Colors.blue),
          ),
        ));
      } else {
        widgetList.add(GestureDetector(
          onTap: () {
            context.router.push(VariableRoute(variable: variable));
          },
          child: Text(
            '(${variable.default_value})',
            style: const TextStyle(color: Colors.blue),
          ),
        ));
      }
    });
    if (textString.isNotEmpty) {
      widgetList.add(Text(textString));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: (widget.criteria.type == 'variable')
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...widgetList,
                ],
              )
            : Text(widget.criteria.text),
      ),
    );
  }
}
