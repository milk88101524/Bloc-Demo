import 'package:flu_counter_demo/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: CounterCubitView(),
    );
  }
}

class CounterCubitView extends StatelessWidget {
  const CounterCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            BlocBuilder<CounterCubit, int>(builder: (context, value) {
              return Text(
                value.toString(),
                style: TextStyle(fontSize: 24),
              );
            }),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().increment(),
              child: Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().decrement(),
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
