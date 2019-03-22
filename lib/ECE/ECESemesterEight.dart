import 'package:flutter/material.dart';
import 'package:gpa_calculator/Utils.dart';
import 'package:gpa_calculator/WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class ECESemesterEight extends StatefulWidget {
  Function(String) updatePointerCallback;

  ECESemesterEight(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _ECESemesterEightState();
}

class _ECESemesterEightState extends State<ECESemesterEight> {
  String _miniProject = '';

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ScrollConfiguration(
          behavior: WithoutOverScrollShadowBehaviour(),
          child: ListView(
            shrinkWrap: false,
            children: <Widget>[
              createGradeInput(
                context,
                'Mini Project',
                hintString: 'Project Grade',
                onChangeTheory: _updateMiniProjectGrade,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _updateMiniProjectGrade(dynamic grade) {
    _miniProject = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateECESemEightGPA(miniProject: _miniProject);

    widget.updatePointerCallback(fp);
  }
}
