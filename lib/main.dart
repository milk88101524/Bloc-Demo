import 'package:flu_counter_demo/pages/counter_bloc_page.dart';
import 'package:flu_counter_demo/pages/counter_cubit_page.dart';
import 'package:flu_counter_demo/pages/counter_stream_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentInt = 0;

  final List<Widget> _pages = [
    CounterStream(),
    CounterCubitPage(),
    CounterBlocPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentInt],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentInt,
        onDestinationSelected: (value) {
          setState(() {
            _currentInt = value;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.one_k_outlined),
            label: "Stream",
          ),
          NavigationDestination(
            icon: Icon(Icons.two_k_outlined),
            label: "Cubit",
          ),
          NavigationDestination(
            icon: Icon(Icons.three_k_outlined),
            label: "Bloc",
          ),
        ],
      ),
    );
  }
}
