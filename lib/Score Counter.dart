// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Counter extends StatefulWidget {
//   const Counter({super.key});
//
//   @override
//   State<Counter> createState() => _CounterState();
// }
//
// // 2. Define its corresponding State class
// class _CounterState extends State<Counter> {
//   // This is the mutable internal state
//   int _counter = 0;
//
//   void _incrementCounter() {
//     // 3. Wrap the variable mutation inside setState()
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("setState Example")),
//       body: Center(
//         child: Text(
//           "Button pressed $_counter times",
//           style: const TextStyle(fontSize: 24),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter, // Triggers the state change
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }