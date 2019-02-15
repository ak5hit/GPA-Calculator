import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MainScreen.dart';
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
              _createGradeInput(
                'Compiler Design',
                isThereAnyLab: true,
                onChangeTheory: _updateCDOTheoryGrade,
                onChangeLab: _updateCDOLabGrade,
              ),
              _createGradeInput(
                'Image and Video Processing',
                isThereAnyLab: true,
                onChangeTheory: _updateIVPTheoryGrade,
                onChangeLab: _updateIVPLabGrade,
              ),
              _createGradeInput(
                'Data Mining and Warehousing',
                isThereAnyLab: true,
                onChangeTheory: _updateDMWTheoryGrade,
                onChangeLab: _updateDMWLabGrade,
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
