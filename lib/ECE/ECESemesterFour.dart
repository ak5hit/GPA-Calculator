import 'package:flutter/material.dart';
import 'package:gpa_calculator/Utils.dart';
import 'package:gpa_calculator/WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class ECESemesterFour extends StatefulWidget {
  Function(String) updatePointerCallback;

  ECESemesterFour(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _ECESemesterFourState();
}

class _ECESemesterFourState extends State<ECESemesterFour> {
  String _dtsTheory = '';
  String _emiTheory = '';
  String _emiLab = '';
  String _mipTheory = '';
  String _mipLab = '';
  String _megTheory = '';
  String _megLab = '';
  String _ictTheory = '';
  String _mmTheory = '';

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
                'Discrete Time Signals and Systems	',
                onChangeTheory: _updateDTSGrade,
              ),
              createGradeInput(
                context,
                'Electronics Measurement and Instrumentation',
                isThereAnyLab: true,
                onChangeTheory: _updateEMITheoryGrade,
                onChangeLab: _updateEMILabGrade,
              ),
              createGradeInput(
                context,
                'Microprocessor Interface and Programming',
                isThereAnyLab: true,
                onChangeTheory: _updateMIPTheoryGrade,
                onChangeLab: _updateMIPLabGrade,
              ),
              createGradeInput(
                context,
                'Microwave Engineering',
                isThereAnyLab: true,
                onChangeTheory: _updateMEGTheoryGrade,
                onChangeLab: _updateMEGLabGrade,
              ),
              createGradeInput(
                context,
                'Integrated Circuits Technology',
                onChangeTheory: _updateICTGrade,
              ),
              createGradeInput(
                context,
                'Marketing Management',
                onChangeTheory: _updateMMGrade,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateDTSGrade(dynamic grade) {
    _dtsTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateEMITheoryGrade(dynamic grade) {
    _emiTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateEMILabGrade(dynamic grade) {
    _emiLab = grade as String;
    _updateFinalPointer();
  }

  void _updateMIPTheoryGrade(dynamic grade) {
    _mipTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateMIPLabGrade(dynamic grade) {
    _mipLab = grade as String;
    _updateFinalPointer();
  }

  void _updateMEGTheoryGrade(dynamic grade) {
    _megTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateMEGLabGrade(dynamic grade) {
    _megLab = grade as String;
    _updateFinalPointer();
  }

  void _updateICTGrade(dynamic grade) {
    _ictTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateMMGrade(dynamic grade) {
    _mmTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateECESemFourGPA(
      dtsTheory: _dtsTheory,
      emiTheory: _emiTheory,
      emiLab: _emiLab,
      mipTheory: _mipTheory,
      mipLab: _mipLab,
      megTheory: _megTheory,
      megLab: _megLab,
      ictTheory: _ictTheory,
      mmTheory: _mmTheory,
    );

    print('Final Pointer: ' + fp);

    widget.updatePointerCallback(fp);
  }
}
