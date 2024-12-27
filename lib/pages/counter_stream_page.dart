import 'package:flu_counter_demo/bloc/stream_counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterStream extends StatelessWidget {
  const CounterStream({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = CounterStreamBloc();

    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Demo"),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: bloc.steam,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            ElevatedButton(
              onPressed: () => bloc.counterEvent.add(Increment()),
              child: Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () => bloc.counterEvent.add(Decrement()),
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
