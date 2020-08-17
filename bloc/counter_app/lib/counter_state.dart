part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int counter;

  CounterState(this.counter);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

class CounterAction extends CounterState {
  CounterAction(int delta) : super(delta);
}
