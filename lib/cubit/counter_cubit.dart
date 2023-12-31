import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(
        counterValue: state.counterValue + 1,
        isIncrement: true,
      ));

  void decrement() => emit(CounterState(
        isIncrement: false,
        counterValue: state.counterValue - 1,
      ));
}
