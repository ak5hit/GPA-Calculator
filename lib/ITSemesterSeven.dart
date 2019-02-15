import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MainScreen.dart';
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
              _createGradeInput(
                'System Modeling and Simulating',
                isThereAnyLab: true,
                onChangeTheory: _updateSIMTheoryGrade,
                onChangeLab: _updateSIMLabGrade,
              ),
              _createGradeInput(
                'Organizational Behaviour',
                onChangeTheory: _updateORBTheoryGrade,
              ),
              _createGradeInput(
                'Elective-1',
                onChangeTheory: _updateElective1Grade,
              ),
              _createGradeInput(
                'Elective-2',
                onChangeTheory: _updateElective2Grade,
              ),
              _createGradeInput(
                'Mini Project',
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

  Widget _createGradeInput(String subject,
      {bool isThereAnyLab = false,
      // ignore: avoid_init_to_null
      ValueChanged<dynamic> onChangeTheory = null,
      // ignore: avoid_init_to_null
      ValueChanged<dynamic> onChangeLab = null}) {
    if (isThereAnyLab) {
      // If there is lab
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '$subject',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _createInputFieldForRow(theoryString, onChangeTheory),
              _createInputFieldForRow(labString, onChangeLab),
            ],
          ),
        ],
      );
    } else {
      // If its only theory subject
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '$subject',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          _createInputField(theoryString, onChangeTheory)
        ],
      );
    }
  }

  Widget _createInputFieldForRow(String hint, ValueChanged<dynamic> onChanged) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300],
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
        child: TextField(
          inputFormatters: [LengthLimitingTextInputFormatter(2)],
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: Theme.of(context).textTheme.caption,
            hintText: '$hint',
          ),
          onChanged: onChanged,
          cursorWidth: 1.0,
          cursorColor: Colors.black,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _createInputField(String hint, ValueChanged<dynamic> onChanged) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300],
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      child: TextField(
        inputFormatters: [LengthLimitingTextInputFormatter(2)],
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.caption,
          hintText: '$hint',
        ),
        onChanged: onChanged,
        cursorWidth: 1.0,
        cursorColor: Colors.black,
        textAlign: TextAlign.center,
      ),
    );
  }
}
