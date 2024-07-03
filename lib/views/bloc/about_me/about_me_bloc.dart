import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/domain/use_case/get_about_me.dart';
import 'package:spnk/views/bloc/about_me/about_me_event.dart';
import 'package:spnk/views/bloc/about_me/about_me_state.dart';

class AboutMeBloc extends Bloc<AboutMeEvent, AboutMeState> {
  final GetAboutMe getAboutMe;
  AboutMeBloc(
    this.getAboutMe,
  ) : super(const AboutMeState()) {
    on(onAboutMe);
  }

  void onAboutMe(FetchAboutMe event, Emitter<AboutMeState> emit) {
    final details = getAboutMe.call();
    emit(state.copyWith(content: details.content));
  }
}
