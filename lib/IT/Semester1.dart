import 'package:flutter/material.dart';
import 'package:gpa_calculator/Utils.dart';
import 'package:gpa_calculator/WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class Semester1 extends StatefulWidget {
  Function(String) updatePointerCallback;

  Semester1(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _Semester1State();
}

class _Semester1State extends State<Semester1> {
  String _edcTheory = '';
  String _edcLab = '';
  String _itpTheory = '';
  String _itpLab = '';
  String _matTheory = '';
  String _egpTheory = '';
  String _egpLab = '';
  String _casTheory = '';
  String _itcLab = '';
  String _lcsLab = '';

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
                'Electronics Devices and Circuits',
                isThereAnyLab: true,
                onChangeTheory: _updateEDCTheoryGrade,
                onChangeLab: _updateEDCLabGrade,
              ),
              createGradeInput(
                context,
                'Introduction to Programming',
                isThereAnyLab: true,
                onChangeTheory: _updateITPTheoryGrade,
                onChangeLab: _updateITPLabGrade,
              ),
              createGradeInput(
                context,
                'Mathematics - 1',
                onChangeTheory: _updateMATGrade,
              ),
              createGradeInput(
                context,
                'Engineering Physics',
                isThereAnyLab: true,
                onChangeTheory: _updateEGPTheoryGrade,
                onChangeLab: _updateEGPLabGrade,
              ),
              createGradeInput(
                context,
                'Circuit Analysis and Synthesis',
                onChangeTheory: _updateCASGrade,
              ),
              createGradeInput(
                context,
                'Introduction to Computers',
                onChangeTheory: _updateITCLabGrade,
                hintString: labString,
              ),
              createGradeInput(
                context,
                'Professional Communication',
                onChangeTheory: _updateLCSLabGrade,
                hintString: labString,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateEDCTheoryGrade(dynamic grade) {
    _edcTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateEDCLabGrade(dynamic grade) {
    _edcLab = grade as String;
    _updateFinalPointer();
  }

  void _updateITPTheoryGrade(dynamic grade) {
    _itpTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateITPLabGrade(dynamic grade) {
    _itpLab = grade as String;
    _updateFinalPointer();
  }

  void _updateMATGrade(dynamic grade) {
    _matTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateEGPTheoryGrade(dynamic grade) {
    _egpTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateEGPLabGrade(dynamic grade) {
    _egpLab = grade as String;
    _updateFinalPointer();
  }

  void _updateCASGrade(dynamic grade) {
    _casTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateITCLabGrade(dynamic grade) {
    _itcLab = grade as String;
    _updateFinalPointer();
  }

  void _updateLCSLabGrade(dynamic grade) {
    _lcsLab = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateITSemOneGPA(
      edcTheory: _edcTheory,
      edcLab: _edcLab,
      itpTheory: _itpTheory,
      itpLab: _itpLab,
      matTheory: _matTheory,
      egpTheory: _egpTheory,
      egpLab: _egpLab,
      casTheory: _casTheory,
      itcLab: _itcLab,
      lcsLab: _lcsLab,
    );

    widget.updatePointerCallback(fp);
  }
}
