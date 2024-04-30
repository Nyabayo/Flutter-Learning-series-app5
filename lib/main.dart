import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  /*This class is the configuration for the state.
  It holds the values (in this case nothing) provided.
  by the parent and used by the build method of the 
  state. Fields in a widget subclass are always maerked "final". */

  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      /* This call to setState tells the Flutter Framework 
      that something has changed in this state, which
      causes it to return the build method below so that 
      the display can reflect the updated values. If  you
      change _counter without calling setState(), then 
      the build method won't be caled again, and 
      so nothing would appear to happen */
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*This method is rerun every time setState is called,
    for instance, as done by the _increment method above. 
    The Flutter framework has been optimized to make
    reruning build methods fast, so that you can just rebuild anything that needs updating rather than
    having to individually changes instances of widgets */

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $_counter'),
      ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
    ),
  );
}
