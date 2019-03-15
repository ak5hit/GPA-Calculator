import 'package:flutter/material.dart';
import 'package:gpa_calculator/Utils.dart';
import 'package:gpa_calculator/WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class ECESemesterThree extends StatefulWidget {
  Function(String) updatePointerCallback;

  ECESemesterThree(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _ECESemesterThreeState();
}

class _ECESemesterThreeState extends State<ECESemesterThree> {
  String _aecTheory = '';
  String _aecLab = '';
  String _osTheory = '';
  String _osLab = '';
  String _efwTheory = '';
  String _acmTheory = '';
  String _acmLab = '';
  String _beeTheory = '';
  String _beeLab = '';

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
                'Analog Electronics',
                isThereAnyLab: true,
                onChangeTheory: _updateAECTheoryGrade,
                onChangeLab: _updateAECLabGrade,
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
                'Electromagnetic Field and Waves',
                onChangeTheory: _updateEFWGrade,
              ),
              createGradeInput(
                context,
                'Analog Communication',
                isThereAnyLab: true,
                onChangeTheory: _updateACMTheoryGrade,
                onChangeLab: _updateACMLabGrade,
              ),
              createGradeInput(
                context,
                'Basic Electrical Engineering',
                isThereAnyLab: true,
                onChangeTheory: _updateBEETheoryGrade,
                onChangeLab: _updateBEELabGrade,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateAECTheoryGrade(dynamic grade) {
    _aecTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateAECLabGrade(dynamic grade) {
    _aecLab = grade as String;
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

  void _updateEFWGrade(dynamic grade) {
    _efwTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateACMTheoryGrade(dynamic grade) {
    _acmTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateACMLabGrade(dynamic grade) {
    _acmLab = grade as String;
    _updateFinalPointer();
  }

  void _updateBEETheoryGrade(dynamic grade) {
    _beeTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateBEELabGrade(dynamic grade) {
    _beeLab = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateECESemThreeGPA(
      aecTheory: _aecTheory,
      aecLab: _aecLab,
      osTheory: _osTheory,
      osLab: _osLab,
      efwTheory: _efwTheory,
      acmTheory: _acmTheory,
      acmLab: _acmLab,
      beeTheory: _beeTheory,
      beeLab: _beeLab,
    );

    widget.updatePointerCallback(fp);
  }
}
