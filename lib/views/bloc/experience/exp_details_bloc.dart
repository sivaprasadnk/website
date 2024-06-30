import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/domain/use_case/get_exp_details.dart';
import 'package:spnk/views/bloc/experience/exp_details_event.dart';
import 'package:spnk/views/bloc/experience/exp_details_state.dart';

class ExpDetailsBloc extends Bloc<ExpDetailsEvent, ExpDetailsState> {
  final GetExpDetails getExpDetails;
  ExpDetailsBloc(this.getExpDetails) : super(const ExpDetailsState()) {
    on<FetchExpDetails>(_getExpDetails);
  }

  void _getExpDetails(FetchExpDetails event, Emitter<ExpDetailsState> emit) {
    final list = getExpDetails.call();
    list.sort((a, b) => b.order.compareTo(a.order));
    emit(state.copyWith(list: list));
  }
}
