// This same utility method is used for Semester three.
String calculateSemFourGPA(
    {String mathTheory = '',
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
