import 'package:flutter/material.dart';
import 'package:practice_provider_package/main.dart' show MyDummyData;
import 'package:provider/provider.dart';

class MyDataDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyDummyData data = context.watch<MyDummyData>();

    return Material(
      elevation: 2.0,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Flexible(
          child: Row(
            children: [
              const Text(
                'Data:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'String data = ${data.data}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text('int counter = ${data.counter}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
