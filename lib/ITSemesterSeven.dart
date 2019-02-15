import 'package:flutter/material.dart';
import 'Utils.dart';

import 'WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class ITSemesterSeven extends StatefulWidget {
  Function(String) updatePointerCallback;

  ITSemesterSeven(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _ITSemesterSevenState();
}

class _ITSemesterSevenState extends State<ITSemesterSeven> {
  String _simTheory = '';
  String _simLab = '';
  String _orbTheory = '';
  String _elective1 = '';
  String _elective2 = '';
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
                'System Modeling and Simulating',
                isThereAnyLab: true,
                onChangeTheory: _updateSIMTheoryGrade,
                onChangeLab: _updateSIMLabGrade,
              ),
              createGradeInput(
                context,
                'Organizational Behaviour',
                onChangeTheory: _updateORBTheoryGrade,
              ),
              createGradeInput(
                context,
                'Elective-1',
                onChangeTheory: _updateElective1Grade,
              ),
              createGradeInput(
                context,
                'Elective-2',
                onChangeTheory: _updateElective2Grade,
              ),
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

  void _updateSIMTheoryGrade(dynamic grade) {
    _simTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateSIMLabGrade(dynamic grade) {
    _simLab = grade as String;
    _updateFinalPointer();
  }

  void _updateORBTheoryGrade(dynamic grade) {
    _orbTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateElective1Grade(dynamic grade) {
    _elective1 = grade as String;
    _updateFinalPointer();
  }

  void _updateElective2Grade(dynamic grade) {
    _elective2 = grade as String;
    _updateFinalPointer();
  }

  void _updateMiniProjectGrade(dynamic grade) {
    _miniProject = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateSemSevenGPA(
        simTheory: _simTheory,
        simLab: _simLab,
        orbTheory: _orbTheory,
        elective1: _elective1,
        elective2: _elective2,
        miniProject: _miniProject);

    widget.updatePointerCallback(fp);
  }
}