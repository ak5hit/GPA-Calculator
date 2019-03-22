import 'package:flutter/material.dart';
import 'package:gpa_calculator/Utils.dart';
import 'package:gpa_calculator/WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class Semester7 extends StatefulWidget {
  Function(String) updatePointerCallback;

  Semester7(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _Semester7State();
}

class _Semester7State extends State<Semester7> {
  String _simTheory = '';
  String _simLab = '';
  String _orbTheory = '';
  String _elective1 = '';
  String _elective2 = '';
  String _elective3 = '';
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
                'Embedded System Design',
                isThereAnyLab: true,
                onChangeTheory: _updateSIMTheoryGrade,
                onChangeLab: _updateSIMLabGrade,
              ),
              createGradeInput(
                context,
                'Wireless Communication',
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
                'Elective-3',
                onChangeTheory: _updateElective3Grade,
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

  void _updateElective3Grade(dynamic grade) {
    _elective3 = grade as String;
    _updateFinalPointer();
  }

  void _updateMiniProjectGrade(dynamic grade) {
    _miniProject = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateITSemSevenGPA(
        simTheory: _simTheory,
        simLab: _simLab,
        orbTheory: _orbTheory,
        elective1: _elective1,
        elective2: _elective2,
        elective3: _elective3,
        miniProject: _miniProject);

    widget.updatePointerCallback(fp);
  }
}
