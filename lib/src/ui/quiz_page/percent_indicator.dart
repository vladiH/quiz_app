import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quiz/src/blocs/index_stack/index_stack_bloc.dart';
import 'package:quiz/src/ui/common/counter_text.dart';
import 'package:quiz/src/utils/colors.dart';

class PercentIndicator extends StatefulWidget {
  final int indexState;
  PercentIndicator(this.indexState);
  @override
  _PercentIndicatorState createState() => _PercentIndicatorState();
}

class _PercentIndicatorState extends State<PercentIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LinearPercentIndicator(
        leading: CounterText((widget.indexState + 1)),
        alignment: MainAxisAlignment.center,
        lineHeight: 14.0,
        percent: (widget.indexState + 1) / context.watch<IndexStackBloc>().end,
        backgroundColor: primaryColorOpacity,
        progressColor: primaryColor,
      ),
    );
  }
}
