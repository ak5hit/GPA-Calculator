import 'package:flutter/material.dart';
import 'MainScreen.dart';

class ITSemesterFour extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ITSemesterFourState();
}

class _ITSemesterFourState extends State<ITSemesterFour> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        createGradeInput('Mathematics - 3', false, print, print),
        createGradeInput(
            'Design and Analysis of Algorithms', true, print, print),
        createGradeInput(
            'Principles of Programming Languages', false, print, print),
        createGradeInput('Database Management Systems', true, print, print),
        createGradeInput('Principles of Communication', true, print, print),

      ],);
  }

  Widget createGradeInput(String subject, bool isThereAnyLab,
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
              createInputField(theoryString, onChangeTheory),
              createInputField(labString, onChangeLab),
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
          createInputField(theoryString, onChangeLab)
        ],
      );
    }
  }

  Widget createInputField(String hint, ValueChanged<dynamic> onChange) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300], width: 1.0,),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),),
      width: 150.0,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: Theme
              .of(context)
              .textTheme
              .caption,
          hintText: '$hint',
        ),
        onChanged: onChange,
        cursorWidth: 1.0,
        cursorColor: Colors.black,
        textAlign: TextAlign.center,),
    );
  }
}
