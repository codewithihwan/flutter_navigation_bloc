import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_cubit_state.dart';

class MyCubit extends Cubit<MyCubitState> {
  MyCubit() : super(StateA());

  void changeState(MyCubitState state) {
   emit(state);
  }
}
