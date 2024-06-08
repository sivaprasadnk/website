import 'package:equatable/equatable.dart';
import 'package:spnk/data/experience_model.dart';

class ExpDetailsState extends Equatable {
  final List<ExperienceModel> expList;
  const ExpDetailsState({
    this.expList = const [],
  });

  @override
  List<Object?> get props => [expList];

  ExpDetailsState copyWith({List<ExperienceModel>? list}) {
    return ExpDetailsState(
      expList: list ?? expList,
    );
  }
}
