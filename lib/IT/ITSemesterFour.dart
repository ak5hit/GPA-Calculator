import 'package:flutter/material.dart';
import 'package:gpa_calculator/Utils.dart';
import 'package:gpa_calculator/WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class ITSemesterFour extends StatefulWidget {

  Function(String) updatePointerCallback;

  ITSemesterFour(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _ITSemesterFourState();
}

class _ITSemesterFourState extends State<ITSemesterFour> {

  String _mathTheory = '';
  String _daaTheory = '';
  String _daaLab = '';
  String _pplTheory = '';
  String _dbmsTheory = '';
  String _dbmsLab = '';
  String _pocTheory = '';
  String _pocLab = '';

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
                'Mathematics - 3',
                onChangeTheory: _updateMathsGrade,),
              createGradeInput(
                context,
                'Design and Analysis of Algorithms',
                isThereAnyLab: true,
                onChangeTheory: _updateDAATheoryGrade,
                onChangeLab: _updateDAALabGrade,),
              createGradeInput(
                context,
                'Principles of Programming Languages',
                onChangeTheory: _updatePPLGrade,),
              createGradeInput(
                context,
                'Database Management Systems',
                isThereAnyLab: true,
                onChangeTheory: _updateDBMSTheoryGrade,
                onChangeLab: _updateDBMSLabGrade,),
              createGradeInput(
                context,
                'Principles of Communication',
                isThereAnyLab: true,
                onChangeTheory: _updatePOCTheoryGrade,
                onChangeLab: _updatePOCLabGrade,),
            ],),
        ),
      ),
    );
  }

  void _updateMathsGrade(dynamic grade) {
    _mathTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateDAATheoryGrade(dynamic grade) {
    _daaTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateDAALabGrade(dynamic grade) {
    _daaLab = grade as String;
    _updateFinalPointer();
  }

  void _updatePPLGrade(dynamic grade) {
    _pplTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateDBMSTheoryGrade(dynamic grade) {
    _dbmsTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateDBMSLabGrade(dynamic grade) {
    _dbmsLab = grade as String;
    _updateFinalPointer();
  }

  void _updatePOCTheoryGrade(dynamic grade) {
    _pocTheory = grade as String;
    _updateFinalPointer();
  }

  void _updatePOCLabGrade(dynamic grade) {
    _pocLab = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateITSemFourGPA(
      mathTheory: _mathTheory,
      daaTheory: _daaTheory,
      daaLab: _daaLab,
      pplTheory: _pplTheory,
      dbmsTheory: _dbmsTheory,
      dbmsLab: _dbmsLab,
      pocTheory: _pocTheory,
      pocLab: _pocLab,);

    print('Final Pointer: ' + fp);

    widget.updatePointerCallback(fp);
  }
}
