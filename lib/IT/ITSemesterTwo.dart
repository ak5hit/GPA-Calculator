import 'package:flutter/material.dart';
import 'package:gpa_calculator/Utils.dart';
import 'package:gpa_calculator/WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class ITSemesterTwo extends StatefulWidget {
  Function(String) updatePointerCallback;

  ITSemesterTwo(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _ITSemesterTwoState();
}

class _ITSemesterTwoState extends State<ITSemesterTwo> {
  String _pbsTheory = '';
  String _dmaTheory = '';
  String _coaTheory = '';
  String _dstTheory = '';
  String _dstLab = '';
  String _delTheory = '';
  String _delLab = '';
  String _pomTheory = '';

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
                'Probability and Statistics',
                onChangeTheory: _updatePBSGrade,
              ),
              createGradeInput(
                context,
                'Discrete Mathematics',
                onChangeTheory: _updateDMAGrade,
              ),
              createGradeInput(
                context,
                'Computer Organization & Architecture',
                onChangeTheory: _updateCOAGrade,
              ),
              createGradeInput(
                context,
                'Data Structures',
                isThereAnyLab: true,
                onChangeTheory: _updateDSTTheoryGrade,
                onChangeLab: _updateDSTLabGrade,
              ),
              createGradeInput(
                context,
                'Digital Electronics',
                isThereAnyLab: true,
                onChangeTheory: _updateDELTheoryGrade,
                onChangeLab: _updateDELLabGrade,
              ),
              createGradeInput(
                context,
                'Priciples of Management',
                onChangeTheory: _updatePOMTheoryGrade,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updatePBSGrade(dynamic grade) {
    _pbsTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateDMAGrade(dynamic grade) {
    _dmaTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateCOAGrade(dynamic grade) {
    _coaTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateDSTTheoryGrade(dynamic grade) {
    _dstTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateDSTLabGrade(dynamic grade) {
    _dstLab = grade as String;
    _updateFinalPointer();
  }

  void _updateDELTheoryGrade(dynamic grade) {
    _delTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateDELLabGrade(dynamic grade) {
    _delLab = grade as String;
    _updateFinalPointer();
  }

  void _updatePOMTheoryGrade(dynamic grade) {
    _pomTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateSemTwoGPA(
      pbsTheory: _pbsTheory,
      dmaTheory: _dmaTheory,
      coaTheory: _coaTheory,
      dstTheory: _dstTheory,
      dstLab: _dstLab,
      delTheory: _delTheory,
      delLab: _delLab,
      pomTheory: _pomTheory,
    );

    widget.updatePointerCallback(fp);
  }
}
