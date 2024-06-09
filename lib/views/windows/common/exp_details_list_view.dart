import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spnk/views/bloc/experience/exp_details_bloc.dart';
import 'package:spnk/views/bloc/experience/exp_details_state.dart';

class ExpDetailsListView extends StatelessWidget {
  const ExpDetailsListView({
    Key? key,
    required this.padding,
  }) : super(key: key);
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displaySmall;
    final bulletPoint = CircleAvatar(
      radius: 5,
      backgroundColor: Theme.of(context).splashColor,
    );

    return BlocBuilder<ExpDetailsBloc, ExpDetailsState>(
      builder: (context, state) {
        return Column(
          children: state.expList.map((exp) {
            return Padding(
              padding: padding,
              child: ListTile(
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp.title,
                      style: textStyle,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        bulletPoint,
                        Text(
                          '      ${exp.orgName}',
                          style: textStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        bulletPoint,
                        Text(
                          '      ${exp.startDate} - ${exp.endDate}',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
