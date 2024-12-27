import 'package:flu_counter_demo/bloc/counter_bloc/counter_state.dart';
import 'package:flu_counter_demo/bloc/stream_counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<Increment>(_increment);
    on<Decrement>(_decrement);
  }

  void _increment(Increment event, Emitter<CounterState> emit) {
    emit(CounterState(state.count + 1));
  }

  void _decrement(Decrement event, Emitter<CounterState> emit) {
    emit(CounterState(state.count - 1));
  }
}
