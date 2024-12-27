import 'package:flu_counter_demo/bloc/counter_bloc/counter_bloc.dart';
import 'package:flu_counter_demo/bloc/counter_bloc/counter_state.dart';
import 'package:flu_counter_demo/bloc/stream_counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: CounterBlocPageView(),
    );
  }
}

class CounterBlocPageView extends StatelessWidget {
  const CounterBlocPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                state.count.toString(),
                style: TextStyle(fontSize: 24),
              );
            }),
            ElevatedButton(
              onPressed: () => context.read<CounterBloc>().add(Increment()),
              child: Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () => context.read<CounterBloc>().add(Decrement()),
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
