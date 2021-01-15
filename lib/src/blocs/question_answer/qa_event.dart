part of 'qa_bloc.dart';

abstract class QAEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadQAEvent extends QAEvent {
  final int opcionMenu;
  LoadQAEvent(this.opcionMenu);
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return 'LoadQAEvent{opcionMenu:$opcionMenu}';
  }
}

class CheckQAEvent extends QAEvent {}
