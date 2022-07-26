import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String data = 'Some initial data...';

  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (BuildContext context) => data,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(data),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Level2();
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Level3();
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final valueProviderOf = Provider.of<String>(context);
    print('valueProviderOf = $valueProviderOf');

    // Equivalent to 'Provider.of', but is accessible only inside [StatelessWidget.build] and [State.build].
    final valueContextWatch = context.watch<String>();
    print('valueContextWatch = $valueContextWatch');

    final valueProviderOfWithoutListening =
        Provider.of<String>(context, listen: false);
    print('valueProviderOfWithoutListening = $valueProviderOfWithoutListening');

    final valueContextRead = context.read<String>();
    print('valueContextRead = $valueContextRead');

    Map<String, String> map = {
      'Provider.of<String>(context)': valueProviderOf,
      'context.watch<String>()': valueContextWatch,
      'Provider.of<String>(context, listen: false)':
          valueProviderOfWithoutListening,
      'context.read<String>()': valueContextRead
    };

    return Center(
      child: MyProviderTestingDisplay(map),
    );
  }
}

class MyProviderTestingDisplay extends StatelessWidget {
  final Map<String, String> map;

  const MyProviderTestingDisplay(this.map);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: map.entries
          .map((e) => DisplayColumn(label: e.key, value: e.value))
          .toList(),
    );
  }
}

class DisplayColumn extends StatelessWidget {
  final String label;
  final String value;

  const DisplayColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: const TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 23.0),
        ),
        const SizedBox(
          height: 55.0,
        ),
      ],
    );
  }
}
