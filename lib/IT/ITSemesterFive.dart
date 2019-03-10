import 'package:flutter/material.dart';
import 'package:gpa_calculator/Utils.dart';
import 'package:gpa_calculator/WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class ITSemesterFive extends StatefulWidget {
  Function(String) updatePointerCallback;

  ITSemesterFive(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _ITSemesterFiveState();
}

class _ITSemesterFiveState extends State<ITSemesterFive> {
  String _cneTheory = '';
  String _cneLab = '';
  String _soeTheory = '';
  String _soeLab = '';
  String _poeTheory = '';
  String _gvcTheory = '';
  String _gvcLab = '';
  String _aiTheory = '';
  String _aiLab = '';
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
                'Computer Networks',
                isThereAnyLab: true,
                onChangeTheory: _updateCNETheoryGrade,
                onChangeLab: _updateCNELabGrade,
              ),
              createGradeInput(
                context,
                'Software Engineering',
                isThereAnyLab: true,
                onChangeTheory: _updateDAATheoryGrade,
                onChangeLab: _updateSOELabGrade,
              ),
              createGradeInput(
                context,
                'Principles of Economics',
                onChangeTheory: _updatePOEGrade,
              ),
              createGradeInput(
                context,
                'Graphics and Visual Computing',
                isThereAnyLab: true,
                onChangeTheory: _updateGVCTheoryGrade,
                onChangeLab: _updateGVCLabGrade,
              ),
              createGradeInput(
                context,
                'Artificial Intelligence',
                isThereAnyLab: true,
                onChangeTheory: _updateAITheoryGrade,
                onChangeLab: _updateAILabGrade,
              ),
              createGradeInput(
                context,
                'Mini Project',
                onChangeTheory: _updateMiniProjectGrade,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _updateCNETheoryGrade(dynamic grade) {
    _cneTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateCNELabGrade(dynamic grade) {
    _cneLab = grade as String;
    _updateFinalPointer();
  }

  void _updateDAATheoryGrade(dynamic grade) {
    _soeTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateSOELabGrade(dynamic grade) {
    _soeLab = grade as String;
    _updateFinalPointer();
  }

  void _updatePOEGrade(dynamic grade) {
    _poeTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateGVCTheoryGrade(dynamic grade) {
    _gvcTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateGVCLabGrade(dynamic grade) {
    _gvcLab = grade as String;
    _updateFinalPointer();
  }

  void _updateAITheoryGrade(dynamic grade) {
    _aiTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateAILabGrade(dynamic grade) {
    _aiLab = grade as String;
    _updateFinalPointer();
  }

  void _updateMiniProjectGrade(dynamic grade) {
    _miniProject = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateSemFiveGPA(
        cneTheory: _cneTheory,
        cneLab: _cneLab,
        soeTheory: _soeTheory,
        soeLab: _soeLab,
        poeTheory: _poeTheory,
        gvcTheory: _gvcTheory,
        gvpLab: _gvcLab,
        aiTheory: _aiTheory,
        aiLab: _aiLab,
        miniProject: _miniProject);

    widget.updatePointerCallback(fp);
  }
}
