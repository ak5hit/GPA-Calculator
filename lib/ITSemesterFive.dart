import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MainScreen.dart';
import 'Utils.dart';

import 'WithoutOverScrollShadowBehaviour.dart';

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
              _createGradeInput(
                'Computer Networks',
                true,
                _updateCNETheoryGrade,
                _updateCNELabGrade,
              ),
              _createGradeInput(
                'Software Engineering',
                true,
                _updateDAATheoryGrade,
                _updateSOELabGrade,
              ),
              _createGradeInput(
                'Principles of Economics',
                false,
                _updatePOEGrade,
                null,
              ),
              _createGradeInput(
                'Graphics and Visual Computing',
                true,
                _updateGVCTheoryGrade,
                _updateGVCLabGrade,
              ),
              _createGradeInput(
                'Artificial Intelligence',
                true,
                _updateAITheoryGrade,
                _updateAILabGrade,
              ),
              _createGradeInput(
                'Mini Project',
                false,
                _updateMiniProjectGrade,
                null,
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

  Widget _createGradeInput(String subject, bool isThereAnyLab,
      ValueChanged<dynamic> onChangeTheory, ValueChanged<dynamic> onChangeLab) {
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
