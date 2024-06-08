import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/domain/experience_entity.dart';
import 'package:spnk/views/bloc/experience/exp_details_event.dart';
import 'package:spnk/views/bloc/experience/exp_details_state.dart';

class ExpDetailsBloc extends Bloc<ExpDetailsEvent, ExpDetailsState> {
  ExpDetailsBloc() : super(const ExpDetailsState()) {
    on<GetExpDetails>(_getExpDetails);
  }

  void _getExpDetails(GetExpDetails event, Emitter<ExpDetailsState> emit) {
    emit(state.copyWith(list: expList));
  }
}
