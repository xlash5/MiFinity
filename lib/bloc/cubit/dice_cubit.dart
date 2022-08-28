import 'package:bloc/bloc.dart';

class DiceCubit extends Cubit<List> {
  DiceCubit() : super([]);

  void add(Map<String, dynamic> result) => emit([...state, result]);

  void reset() => emit([]);
}
