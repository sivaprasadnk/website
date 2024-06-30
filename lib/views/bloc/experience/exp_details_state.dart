import 'package:equatable/equatable.dart';
import 'package:spnk/domain/entity/experience_details.dart';

class ExpDetailsState extends Equatable {
  final List<ExperienceDetails> expList;
  const ExpDetailsState({
    this.expList = const [],
  });

  @override
  List<Object?> get props => [expList];

  ExpDetailsState copyWith({List<ExperienceDetails>? list}) {
    return ExpDetailsState(
      expList: list ?? expList,
    );
  }
}
