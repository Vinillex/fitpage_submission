import 'package:flutter/material.dart';

import '../model/variable/variable.dart';

class VariableScreen extends StatelessWidget {
  final Variable variable;

  const VariableScreen({Key? key, required this.variable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (variable.values != null) {
      variable.values?.sort((a, b) => a.abs().compareTo(b.abs()));
    }
    return Scaffold(
      backgroundColor: Color(0xFF01131B),
      appBar: AppBar(
        title: const Text(
          'Variable Screen',
        ),
      ),
      body: (variable.type == 'value')
          ? ListView.separated(
              itemCount: variable.values!.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(variable.values![i].toString()),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.white,
                  thickness: 0.5,
                  indent: 20,
                  endIndent: 20,
                );
              },
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    variable.study_type!.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Set Parameters'),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            variable.parameter_name![0].toUpperCase() +
                                variable.parameter_name!
                                    .substring(1)
                                    .toLowerCase(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            initialValue: variable.default_value!.toString(),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
