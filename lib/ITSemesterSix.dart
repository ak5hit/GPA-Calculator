import 'package:flutter/material.dart';
import 'Utils.dart';

import 'WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class ITSemesterSix extends StatefulWidget {
  Function(String) updatePointerCallback;

  ITSemesterSix(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _ITSemesterSixState();
}

class _ITSemesterSixState extends State<ITSemesterSix> {
  String _cdoTheory = '';
  String _cdoLab = '';
  String _ivpTheory = '';
  String _ivpLab = '';
  String _dmwTheory = '';
  String _dmwLab = '';
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
                'Compiler Design',
                isThereAnyLab: true,
                onChangeTheory: _updateCDOTheoryGrade,
                onChangeLab: _updateCDOLabGrade,
              ),
              createGradeInput(
                context,
                'Image and Video Processing',
                isThereAnyLab: true,
                onChangeTheory: _updateIVPTheoryGrade,
                onChangeLab: _updateIVPLabGrade,
              ),
              createGradeInput(
                context,
                'Data Mining and Warehousing',
                isThereAnyLab: true,
                onChangeTheory: _updateDMWTheoryGrade,
                onChangeLab: _updateDMWLabGrade,
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

  void _updateCDOTheoryGrade(dynamic grade) {
    _cdoTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateCDOLabGrade(dynamic grade) {
    _cdoLab = grade as String;
    _updateFinalPointer();
  }

  void _updateIVPTheoryGrade(dynamic grade) {
    _ivpTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateIVPLabGrade(dynamic grade) {
    _ivpLab = grade as String;
    _updateFinalPointer();
  }

  void _updateDMWTheoryGrade(dynamic grade) {
    _dmwTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateDMWLabGrade(dynamic grade) {
    _dmwLab = grade as String;
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
    String fp = calculateSemSixGPA(
        cdoTheory: _cdoTheory,
        cdoLab: _cdoLab,
        ivpTheory: _ivpTheory,
        ivpLab: _ivpLab,
        dmwTheory: _dmwTheory,
        dmwLab: _dmwLab,
        elective1: _elective1,
        elective2: _elective2,
        miniProject: _miniProject);

    widget.updatePointerCallback(fp);
  }
}
