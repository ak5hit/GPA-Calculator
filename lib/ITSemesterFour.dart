import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MainScreen.dart';
import 'Utils.dart';

import 'WithoutOverScrollShadowBehaviour.dart';

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
              _createGradeInput(
                'Mathematics - 3', false, _updateMathsGrade, null,),
              _createGradeInput(
                'Design and Analysis of Algorithms', true,
                _updateDAATheoryGrade, _updateDAALabGrade,),
              _createGradeInput(
                'Principles of Programming Languages', false,
                _updatePPLGrade, null,),
              _createGradeInput(
                'Database Management Systems', true,
                _updateDBMSTheoryGrade, _updateDBMSLabGrade,),
              _createGradeInput(
                'Principles of Communication', true,
                _updatePOCTheoryGrade, _updatePOCLabGrade,),
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
    String fp = calculateSemFourGPA(
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

  Widget _createGradeInput(String subject, bool isThereAnyLab,
      ValueChanged<dynamic> onChangeTheory, ValueChanged<dynamic> onChangeLab) {
    if (isThereAnyLab) {
      // If there is lab
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('$subject', style: TextStyle(fontSize: 18.0),),
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
            child: Text('$subject', style: TextStyle(fontSize: 18.0),),
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
          border: Border.all(color: Colors.grey[300], width: 1.0,),
          borderRadius: BorderRadius.all(Radius.circular(2.0)),),
        child: TextField(
          inputFormatters: [LengthLimitingTextInputFormatter(2)],
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: Theme
                .of(context)
                .textTheme
                .caption,
            hintText: '$hint',
          ),
          onChanged: onChanged,
          cursorWidth: 1.0,
          cursorColor: Colors.black,
          textAlign: TextAlign.center,),
      ),
    );
  }

  Widget _createInputField(String hint, ValueChanged<dynamic> onChanged) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300], width: 1.0,),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),),
      child: TextField(
        inputFormatters: [LengthLimitingTextInputFormatter(2)],
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: Theme
              .of(context)
              .textTheme
              .caption,
          hintText: '$hint',
        ),
        onChanged: onChanged,
        cursorWidth: 1.0,
        cursorColor: Colors.black,
        textAlign: TextAlign.center,),
    );
  }
}
