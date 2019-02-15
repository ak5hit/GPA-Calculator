import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MainScreen.dart';
import 'Utils.dart';

// ignore: must_be_immutable
class ITSemesterThree extends StatefulWidget {

  Function(String) updatePointerCallback;

  ITSemesterThree(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _ITSemesterThreeState();
}

class _ITSemesterThreeState extends State<ITSemesterThree> {

  String _mathTheory = '';
  String _osTheory = '';
  String _osLab = '';
  String _tocTheory = '';
  String _oomTheory = '';
  String _oomLab = '';
  String _micTheory = '';
  String _micLab = '';

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          shrinkWrap: false,
          children: <Widget>[
            _createGradeInput(
              'Mathematics - 2', false, _updateMathsGrade, null,),
            _createGradeInput(
              'Operating System', true,
              _updateOSTheoryGrade, _updateOSLabGrade,),
            _createGradeInput(
              'Theory of Computation', false,
              _updateTOCGrade, null,),
            _createGradeInput(
              'Object Oriented Methodologies', true,
              _updateOOMTheoryGrade, _updateOOMLabGrade,),
            _createGradeInput(
              'Microprocessors', true,
              _updateMIPTheoryGrade, _updateMICLabGrade,),
          ],),
      ),
    );
  }

  void _updateMathsGrade(dynamic grade) {
    _mathTheory = grade as String;
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

  void _updateTOCGrade(dynamic grade) {
    _tocTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateOOMTheoryGrade(dynamic grade) {
    _oomTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateOOMLabGrade(dynamic grade) {
    _oomLab = grade as String;
    _updateFinalPointer();
  }

  void _updateMIPTheoryGrade(dynamic grade) {
    _micTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateMICLabGrade(dynamic grade) {
    _micLab = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateSemFourGPA(
      mathTheory: _mathTheory,
      daaTheory: _osTheory,
      daaLab: _osLab,
      pplTheory: _tocTheory,
      dbmsTheory: _oomTheory,
      dbmsLab: _oomLab,
      pocTheory: _micTheory,
      pocLab: _micLab,);


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