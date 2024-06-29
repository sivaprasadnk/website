import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/views/bloc/experience/exp_details_bloc.dart';
import 'package:spnk/views/bloc/experience/exp_details_state.dart';
import 'package:spnk/views/windows/common/exp_container.dart';

class ExpDetailsListView extends StatelessWidget {
  const ExpDetailsListView({
    Key? key,
    required this.padding,
  }) : super(key: key);
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ExpDetailsBloc, ExpDetailsState>(
      builder: (context, state) {
        return SizedBox(
          height: 350,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Scrollbar(
                child: Wrap(
                  children: state.expList.map((exp) {
                    return ExpContainer(
                      experience: exp,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );

      },
    );
  }
}
