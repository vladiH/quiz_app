import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'index_stack_event.dart';

class IndexStackBloc extends Bloc<IndexStackEvent, int> {
  int index = 0;
  final int end;
  IndexStackBloc(this.end) : super(0);
  @override
  Stream<int> mapEventToState(IndexStackEvent event) async* {
    if (event is NextIndexStack) {
      yield* _mapNextIndexStackToState();
    }
  }

  Stream<int> _mapNextIndexStackToState() async* {
    this.index++;
    if (this.index < this.end) {
      yield this.index;
    }
  }
}
