Changing widgets in response to input

### The Basics: Flutter and Widgets
Flutter is a framework used for building cross-platform mobile, desktop, and web applications. In Flutter, everything on the screen is a widget—from a simple text to complex layouts.

### The Code Explained
#### 1. **Import Statement**
```dart
import 'package:flutter/material.dart';
```
This line imports the Material Design library from Flutter, which provides a lot of ready-to-use widgets and styling options that follow Material Design principles.

#### 2. **Counter StatefulWidget**
```dart
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}
```
- `Counter` is a StatefulWidget, meaning it can maintain state that might change during the lifetime of the widget.
- `createState()` is a method that Flutter calls to get a fresh instance of a state object. Here, it returns an instance of `_CounterState`, which is where the logic and state for the Counter are kept.

#### 3. **_CounterState Class**
```dart
class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
```
- `_CounterState` is a class that extends `State<Counter>`. This class manages the state for the `Counter` widget.
- `_counter` is a variable that starts at 0. It keeps track of how many times the button has been pressed.
- `_increment()` is a method that increases the `_counter` by 1 whenever it's called. `setState()` is used here to notify the framework that the state has changed, prompting it to redraw the widget.
- `build()` method returns a `Row` widget containing the button and text displaying the count. This method is called every time `setState()` is triggered.
   - `ElevatedButton` is a material design button that, when pressed (defined by `onPressed`), calls `_increment`.
   - `Text` displays the current value of `_counter`.
   - `SizedBox` is used to add a fixed space of 16 pixels between the button and the text.

#### 4. **main() Function**
```dart
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
    ),
  );
}
```
- `main()` is the entry point of all Dart programs. `runApp()` initializes the app and inflates the widget tree.
- `MaterialApp` is a convenience widget that wraps several widgets that are commonly required for material design applications.
- `Scaffold` provides a high-level structure to the UI that supports app bars, body, drawers, etc.
- `Center` is a layout widget that centers its child within itself. Here, it's used to center the `Counter` widget on the screen.

This setup demonstrates a simple counter that uses state management within `StatefulWidget` to update the UI dynamically based on user interactions.