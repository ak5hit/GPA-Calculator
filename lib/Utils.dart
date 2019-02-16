import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const branchNames = ['IT', 'ECE'];
const pointer = ['GPA', 'CGPA'];
const theoryString = 'Theory Grade';
const labString = 'Lab Grade';

// This same utility method is used for Semester three.
String calculateSemFourGPA({String mathTheory = '',
  String daaTheory = '',
  String daaLab = '',
  String pplTheory = '',
  String dbmsTheory = '',
  String dbmsLab = '',
  String pocTheory = '',
  String pocLab = ''}) {
  double mT = pointerForGrade(formatInputGrade(mathTheory));
  double dT = pointerForGrade(formatInputGrade(daaTheory));
  double dL = pointerForGrade(formatInputGrade(daaLab));
  double pT = pointerForGrade(formatInputGrade(pplTheory));
  double dbT = pointerForGrade(formatInputGrade(dbmsTheory));
  double dbL = pointerForGrade(formatInputGrade(dbmsLab));
  double poT = pointerForGrade(formatInputGrade(pocTheory));
  double poL = pointerForGrade(formatInputGrade(pocLab));

  double fp = ((mT * 3 +
      dT * 3 +
      dL * 2 +
      pT * 3 +
      dbT * 3 +
      dbL * 2 +
      poT * 3 +
      poL * 2) /
      (3 * (mT == 0 ? 0 : 1) +
          3 * (dT == 0 ? 0 : 1) +
          2 * (dL == 0 ? 0 : 1) +
          3 * (pT == 0 ? 0 : 1) +
          3 * (dbT == 0 ? 0 : 1) +
          2 * (dbL == 0 ? 0 : 1) +
          3 * (poT == 0 ? 0 : 1) +
          2 * (poL == 0 ? 0 : 1)));
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

String calculateSemFiveGPA({String cneTheory = '',
  String cneLab = '',
  String soeTheory = '',
  String soeLab = '',
  String poeTheory = '',
  String gvcTheory = '',
  String gvpLab = '',
  String aiTheory = '',
  String aiLab = '',
  String miniProject = ''}) {
  double cT = pointerForGrade(formatInputGrade(cneTheory));
  double cL = pointerForGrade(formatInputGrade(cneLab));
  double sT = pointerForGrade(formatInputGrade(soeTheory));
  double sL = pointerForGrade(formatInputGrade(soeLab));
  double pT = pointerForGrade(formatInputGrade(poeTheory));
  double gT = pointerForGrade(formatInputGrade(gvcTheory));
  double gL = pointerForGrade(formatInputGrade(gvpLab));
  double aT = pointerForGrade(formatInputGrade(aiTheory));
  double aL = pointerForGrade(formatInputGrade(aiLab));
  double mP = pointerForGrade(formatInputGrade(miniProject));

  double fp = ((cT * 3 +
      cL * 2 +
      sT * 3 +
      sL * 2 +
      pT * 3 +
      gT * 3 +
      gL * 2 +
      aT * 3 +
      aL * 2 +
      mP * 5) /
      (3 * (cT == 0 ? 0 : 1) +
          2 * (cL == 0 ? 0 : 1) +
          3 * (sT == 0 ? 0 : 1) +
          2 * (sL == 0 ? 0 : 1) +
          3 * (pT == 0 ? 0 : 1) +
          3 * (gT == 0 ? 0 : 1) +
          2 * (gL == 0 ? 0 : 1) +
          3 * (aT == 0 ? 0 : 1) +
          2 * (aL == 0 ? 0 : 1) +
          5 * (mP == 0 ? 0 : 1)));
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

String calculateSemSixGPA({String cdoTheory = '',
  String cdoLab = '',
  String ivpTheory = '',
  String ivpLab = '',
  String dmwTheory = '',
  String dmwLab = '',
  String elective1 = '',
  String elective2 = '',
  String miniProject = ''}) {
  double cT = pointerForGrade(formatInputGrade(cdoTheory));
  double cL = pointerForGrade(formatInputGrade(cdoLab));
  double iT = pointerForGrade(formatInputGrade(ivpTheory));
  double iL = pointerForGrade(formatInputGrade(ivpLab));
  double dT = pointerForGrade(formatInputGrade(dmwTheory));
  double dL = pointerForGrade(formatInputGrade(dmwLab));
  double e1 = pointerForGrade(formatInputGrade(elective1));
  double e2 = pointerForGrade(formatInputGrade(elective2));
  double mP = pointerForGrade(formatInputGrade(miniProject));

  double fp = ((cT * 3 +
      cL * 2 +
      iT * 3 +
      iL * 2 +
      dT * 3 +
      dL * 2 +
      e1 * 3 +
      e2 * 3 +
      mP * 5) /
      (3 * (cT == 0 ? 0 : 1) +
          2 * (cL == 0 ? 0 : 1) +
          3 * (iT == 0 ? 0 : 1) +
          2 * (iL == 0 ? 0 : 1) +
          3 * (dT == 0 ? 0 : 1) +
          2 * (dL == 0 ? 0 : 1) +
          3 * (e1 == 0 ? 0 : 1) +
          3 * (e2 == 0 ? 0 : 1) +
          5 * (mP == 0 ? 0 : 1)));
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

String calculateSemSevenGPA({String simTheory = '',
  String simLab = '',
  String orbTheory = '',
  String elective1 = '',
  String elective2 = '',
  String miniProject = ''}) {
  double sT = pointerForGrade(formatInputGrade(simTheory));
  double sL = pointerForGrade(formatInputGrade(simLab));
  double oT = pointerForGrade(formatInputGrade(orbTheory));
  double e1 = pointerForGrade(formatInputGrade(elective1));
  double e2 = pointerForGrade(formatInputGrade(elective2));
  double mP = pointerForGrade(formatInputGrade(miniProject));

  double fp = ((sT * 3 +
      sL * 2 +
      oT * 3 +
      e1 * 3 +
      e2 * 3 +
      mP * 5) /
      (3 * (sT == 0 ? 0 : 1) +
          2 * (sL == 0 ? 0 : 1) +
          2 * (oT == 0 ? 0 : 1) +
          3 * (e1 == 0 ? 0 : 1) +
          3 * (e2 == 0 ? 0 : 1) +
          5 * (mP == 0 ? 0 : 1)));
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

String calculateSemEightGPA({
  String posLab = '',
  String elective = '',
  String miniProject = ''}) {
  double pL = pointerForGrade(formatInputGrade(posLab));
  double e = pointerForGrade(formatInputGrade(elective));
  double mP = pointerForGrade(formatInputGrade(miniProject));

  double fp = ((pL * 3 +
      e * 3 +
      mP * 5) /
      (3 * (pL == 0 ? 0 : 1) +
          3 * (e == 0 ? 0 : 1) +
          5 * (mP == 0 ? 0 : 1)));
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

String formatInputGrade(String inputGrade) => inputGrade.toUpperCase();

double pointerForGrade(String grade) {
  switch (grade) {
    case 'A+':
      return 10;
    case 'A':
      return 9;
    case 'B+':
      return 8;
    case 'B':
      return 7;
    case 'C':
      return 6;
    case 'D':
      return 5;
    default:
      return 0;
  }
}

Widget createGradeInput(BuildContext context, String courseName,
    {bool isThereAnyLab = false,
      // ignore: avoid_init_to_null
      ValueChanged<dynamic> onChangeTheory = null,
      // ignore: avoid_init_to_null
      ValueChanged<dynamic> onChangeLab = null,
      String hintString = theoryString,}) {
  if (isThereAnyLab) {
    // If there is lab
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            '$courseName',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _createInputFieldForRow(context, theoryString, onChangeTheory),
            _createInputFieldForRow(context, labString, onChangeLab),
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
            '$courseName',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        _createInputField(context,
          hintString != null ? hintString : theoryString,
          onChangeTheory,)
      ],
    );
  }
}

Widget _createInputFieldForRow(BuildContext context, String hint,
    ValueChanged<dynamic> onChanged) {
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
          hintStyle: Theme
              .of(context)
              .textTheme
              .caption,
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

Widget _createInputField(BuildContext context, String hint,
    ValueChanged<dynamic> onChanged) {
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
        hintStyle: Theme
            .of(context)
            .textTheme
            .caption,
        hintText: '$hint',
      ),
      onChanged: onChanged,
      cursorWidth: 1.0,
      cursorColor: Colors.black,
      textAlign: TextAlign.center,
    ),
  );
}
