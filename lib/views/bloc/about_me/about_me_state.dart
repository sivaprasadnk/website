import 'package:equatable/equatable.dart';

class AboutMeState extends Equatable {
  final String content;
  const AboutMeState({
    this.content = "",
  });

  @override
  List<Object?> get props => [content];

  AboutMeState copyWith({
    String? content,
  }) {
    return AboutMeState(
      content: content ?? this.content,
    );
  }
}
