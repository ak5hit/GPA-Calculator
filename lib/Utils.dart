import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Don't auto indent this file, never.

const branchNames = ['IT', 'ECE'];
const pointer = ['GPA', 'CGPA'];
const theoryString = 'Theory Grade';
const labString = 'Lab Grade';

String calculateITSemOneGPA({
  String edcTheory = '',
  String edcLab = '',
  String itpTheory = '',
  String itpLab = '',
  String matTheory = '',
  String egpTheory = '',
  String egpLab = '',
  String casTheory = '',
  String itcLab = '',
  String lcsLab = ''}) {
  double edT = pointerForGrade(formatInputGrade(edcTheory));
  double edL = pointerForGrade(formatInputGrade(edcLab));
  double ipT = pointerForGrade(formatInputGrade(itpTheory));
  double ipL = pointerForGrade(formatInputGrade(itpLab));
  double mT = pointerForGrade(formatInputGrade(matTheory));
  double egT = pointerForGrade(formatInputGrade(egpTheory));
  double egL = pointerForGrade(formatInputGrade(egpLab));
  double caT = pointerForGrade(formatInputGrade(casTheory));
  double icL = pointerForGrade(formatInputGrade(itcLab));
  double lcL = pointerForGrade(formatInputGrade(lcsLab));

  double fp = ((edT * 3 +
      edL * 2 +
      ipT * 3 +
      ipL * 2 +
      mT * 3 +
      egT * 3 +
      egL * 2 +
      caT * 3 +
      icL * 2 +
      lcL * 2) /
      (3 * (edT == 0 ? 0 : 1) +
          2 * (edL == 0 ? 0 : 1) +
          3 * (ipT == 0 ? 0 : 1) +
          2 * (ipL == 0 ? 0 : 1) +
          3 * (mT == 0 ? 0 : 1) +
          3 * (egT == 0 ? 0 : 1) +
          2 * (egL == 0 ? 0 : 1) +
          3 * (caT == 0 ? 0 : 1) +
          2 * (icL == 0 ? 0 : 1) +
          2 * (lcL == 0 ? 0 : 1)));
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

String calculateITSemTwoGPA({String pbsTheory = '',
  String dmaTheory = '',
  String coaTheory = '',
  String dstTheory = '',
  String dstLab = '',
  String delTheory = '',
  String delLab = '',
  String pomTheory = ''}) {
  double pT = pointerForGrade(formatInputGrade(pbsTheory));
  double dmT = pointerForGrade(formatInputGrade(dmaTheory));
  double cT = pointerForGrade(formatInputGrade(coaTheory));
  double dT = pointerForGrade(formatInputGrade(dstTheory));
  double dL = pointerForGrade(formatInputGrade(dstLab));
  double deT = pointerForGrade(formatInputGrade(delTheory));
  double deL = pointerForGrade(formatInputGrade(delLab));
  double poT = pointerForGrade(formatInputGrade(pomTheory));

  double fp = ((pT * 3 +
      dmT * 3 +
      cT * 3 +
      dT * 3 +
      dL * 2 +
      deT * 3 +
      deL * 2 +
      poT * 3) /
      (3 * (pT == 0 ? 0 : 1) +
          3 * (dmT == 0 ? 0 : 1) +
          3 * (cT == 0 ? 0 : 1) +
          3 * (dT == 0 ? 0 : 1) +
          2 * (dL == 0 ? 0 : 1) +
          3 * (deT == 0 ? 0 : 1) +
          2 * (deL == 0 ? 0 : 1) +
          3 * (poT == 0 ? 0 : 1)));
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

// This same utility method is used for Semester three.
String calculateITSemFourGPA({String mathTheory = '',
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

String calculateITSemFiveGPA({String cneTheory = '',
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

String calculateITSemSixGPA({String cdoTheory = '',
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

String calculateITSemSevenGPA({String simTheory = '',
  String simLab = '',
  String orbTheory = '',
  String elective1 = '',
  String elective2 = '',
  String elective3 = '',
  String miniProject = ''}) {
  double sT = pointerForGrade(formatInputGrade(simTheory));
  double sL = pointerForGrade(formatInputGrade(simLab));
  double oT = pointerForGrade(formatInputGrade(orbTheory));
  double e1 = pointerForGrade(formatInputGrade(elective1));
  double e2 = pointerForGrade(formatInputGrade(elective2));
  double e3 = pointerForGrade(formatInputGrade(elective3));
  double mP = pointerForGrade(formatInputGrade(miniProject));

  double fp = ((sT * 3 +
      sL * 2 +
      oT * 3 +
      e1 * 3 +
      e2 * 3 +
      e3 * 3 +
      mP * 5) /
      (3 * (sT == 0 ? 0 : 1) +
          2 * (sL == 0 ? 0 : 1) +
          2 * (oT == 0 ? 0 : 1) +
          3 * (e1 == 0 ? 0 : 1) +
          3 * (e2 == 0 ? 0 : 1) +
          3 * (e3 == 0 ? 0 : 1) +
          5 * (mP == 0 ? 0 : 1)));
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

String calculateITSemEightGPA({
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

String calculateECESemThreeGPA({String aecTheory = '',
  String aecLab = '',
  String osTheory = '',
  String osLab = '',
  String efwTheory = '',
  String acmTheory = '',
  String acmLab = '',
  String beeTheory = '',
  String beeLab = ''}) {
  double mT = pointerForGrade(formatInputGrade(aecTheory));
  double mL = pointerForGrade(formatInputGrade(aecLab));
  double dT = pointerForGrade(formatInputGrade(osTheory));
  double dL = pointerForGrade(formatInputGrade(osLab));
  double pT = pointerForGrade(formatInputGrade(efwTheory));
  double dbT = pointerForGrade(formatInputGrade(acmTheory));
  double dbL = pointerForGrade(formatInputGrade(acmLab));
  double poT = pointerForGrade(formatInputGrade(beeTheory));
  double poL = pointerForGrade(formatInputGrade(beeLab));

  double fp = ((mT * 3 +
      mL * 2 +
      dT * 3 +
      dL * 2 +
      pT * 3 +
      dbT * 3 +
      dbL * 2 +
      poT * 3 +
      poL * 2) /
      (3 * (mT == 0 ? 0 : 1) +
          2 * (mL == 0 ? 0 : 1) +
          3 * (dT == 0 ? 0 : 1) +
          2 * (dL == 0 ? 0 : 1) +
          3 * (pT == 0 ? 0 : 1) +
          3 * (dbT == 0 ? 0 : 1) +
          2 * (dbL == 0 ? 0 : 1) +
          3 * (poT == 0 ? 0 : 1) +
          2 * (poL == 0 ? 0 : 1)));
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

String calculateECESemFourGPA({String dtsTheory = '',
  String emiTheory = '',
  String emiLab = '',
  String mipTheory = '',
  String mipLab = '',
  String megTheory = '',
  String megLab = '',
  String ictTheory = '',
  String mmTheory = '',}) {
  double mT = pointerForGrade(formatInputGrade(dtsTheory));
  double dT = pointerForGrade(formatInputGrade(emiTheory));
  double dL = pointerForGrade(formatInputGrade(emiLab));
  double dbT = pointerForGrade(formatInputGrade(mipTheory));
  double dbL = pointerForGrade(formatInputGrade(mipLab));
  double poT = pointerForGrade(formatInputGrade(megTheory));
  double poL = pointerForGrade(formatInputGrade(megLab));
  double pT = pointerForGrade(formatInputGrade(ictTheory));
  double mmT = pointerForGrade(formatInputGrade(mmTheory));

  double fp = ((mT * 3 +
      dT * 3 +
      dL * 2 +
      dbT * 3 +
      dbL * 2 +
      poT * 3 +
      poL * 2 +
      pT * 3 +
      mmT * 3) /
      (3 * (mT == 0 ? 0 : 1) +

          3 * (dT == 0 ? 0 : 1) +
          2 * (dL == 0 ? 0 : 1) +
          3 * (dbT == 0 ? 0 : 1) +
          2 * (dbL == 0 ? 0 : 1) +
          3 * (poT == 0 ? 0 : 1) +
          2 * (poL == 0 ? 0 : 1) +
          3 * (pT == 0 ? 0 : 1) +
          3 * (mmT == 0 ? 0 : 1)));
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

String calculateECESemEightGPA({
  String miniProject = ''}) {
  double mP = pointerForGrade(formatInputGrade(miniProject));

  double fp = ((
      mP * 20) /
      (20 * (mP == 0 ? 0 : 1)));
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

saveGradesFor(String branchSem, List<String> grades) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setStringList(branchSem, grades);
}

Future<List<String>> readGradesFor(String branchSem) async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(branchSem) ?? new List<String>();
}

String calculateCGPAFor(List<String> gpas, int semestersDone) {
  double num = 0,
      den = 0;
  for (int i = 0; i < semestersDone; ++i) {
    num += formatInputGPA(gpas[i]) * creditsForSem(i);
    den += ((gpas[i] == "") ? 0 : 1) * creditsForSem(i);
  }
  double fp = num / den;
  return fp.isFinite ? fp.toStringAsFixed(2) : '0.0';
}

double formatInputGPA(String gpa) {
  return double.tryParse(gpa) ?? double.parse("0");
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

int creditsForSem(int sem) {
  switch (sem + 1) {
    case 1:
      return 25;
    case 2:
      return 25;
    case 3:
      return 25;
    case 4:
      return 25;
    case 5:
      return 25;
    case 6:
      return 25;
    case 7:
      return 25;
    case 8:
      return 25;
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
      // ignore: avoid_init_to_null
      TextEditingController controllerTheory = null,
      // ignore: avoid_init_to_null
      TextEditingController controllerLab = null,
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
            createInputFieldForRow(
                context, theoryString, onChangeTheory, controllerTheory),
            createInputFieldForRow(
                context, labString, onChangeLab, controllerLab),
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
        createInputField(context,
          hintString != null ? hintString : theoryString,
            onChangeTheory, controllerTheory)
      ],
    );
  }
}

Widget createInputFieldForRow(BuildContext context, String hint,
    ValueChanged<dynamic> onChanged, TextEditingController controller) {
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
        autocorrect: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: Theme
              .of(context)
              .textTheme
              .caption,
          hintText: '$hint',
        ),
        onChanged: onChanged,
        controller: controller,
        cursorWidth: 1.0,
        cursorColor: Colors.black,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget createInputField(BuildContext context, String hint,
    ValueChanged<dynamic> onChanged, TextEditingController controller) {
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
      autocorrect: false,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: Theme
            .of(context)
            .textTheme
            .caption,
        hintText: '$hint',
      ),
      onChanged: onChanged,
      controller: controller,
      cursorWidth: 1.0,
      cursorColor: Colors.black,
      textAlign: TextAlign.center,
    ),
  );
}
