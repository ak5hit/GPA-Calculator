import 'package:flutter/material.dart';
import 'package:gpa_calculator/Utils.dart';
import 'package:gpa_calculator/WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class Semester3 extends StatefulWidget {
  Function(String) updatePointerCallback;

  Semester3(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _Semester3State();
}

class _Semester3State extends State<Semester3> {
  String _mathTheory = '';
  String _osTheory = '';
  String _osLab = '';
  String _tocTheory = '';
  String _oomTheory = '';
  String _oomLab = '';
  String _micTheory = '';
  String _micLab = '';

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
                'Mathematics - 2',
                onChangeTheory: _updateMathsGrade,
              ),
              createGradeInput(
                context,
                'Operating System',
                isThereAnyLab: true,
                onChangeTheory: _updateOSTheoryGrade,
                onChangeLab: _updateOSLabGrade,
              ),
              createGradeInput(
                context,
                'Theory of Computation',
                onChangeTheory: _updateTOCGrade,
              ),
              createGradeInput(
                context,
                'Object Oriented Methodologies',
                isThereAnyLab: true,
                onChangeTheory: _updateOOMTheoryGrade,
                onChangeLab: _updateOOMLabGrade,
              ),
              createGradeInput(
                context,
                'Microprocessors',
                isThereAnyLab: true,
                onChangeTheory: _updateMIPTheoryGrade,
                onChangeLab: _updateMICLabGrade,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateMathsGrade(dynamic grade) {
    _mathTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateOSTheoryGrade(dynamic grade) {
    _osTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateOSLabGrade(dynamic grade) {
    _osLab = grade as String;
    _updateFinalPointer();
  }

  void _updateTOCGrade(dynamic grade) {
    _tocTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateOOMTheoryGrade(dynamic grade) {
    _oomTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateOOMLabGrade(dynamic grade) {
    _oomLab = grade as String;
    _updateFinalPointer();
  }

  void _updateMIPTheoryGrade(dynamic grade) {
    _micTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateMICLabGrade(dynamic grade) {
    _micLab = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateITSemFourGPA(
      mathTheory: _mathTheory,
      daaTheory: _osTheory,
      daaLab: _osLab,
      pplTheory: _tocTheory,
      dbmsTheory: _oomTheory,
      dbmsLab: _oomLab,
      pocTheory: _micTheory,
      pocLab: _micLab,
    );

    widget.updatePointerCallback(fp);
  }
}
