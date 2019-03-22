import 'package:flutter/material.dart';
import 'package:gpa_calculator/IT/Semester1.dart' as it;
import 'package:gpa_calculator/IT/Semester2.dart' as it;
import 'package:gpa_calculator/IT/Semester3.dart' as it;
import 'package:gpa_calculator/IT/Semester4.dart' as it;
import 'package:gpa_calculator/IT/Semester5.dart' as it;
import 'package:gpa_calculator/IT/Semester6.dart' as it;
import 'package:gpa_calculator/IT/Semester7.dart' as it;
import 'package:gpa_calculator/IT/Semester8.dart' as it;

import 'package:gpa_calculator/ECE/Semester3.dart' as ece;
import 'package:gpa_calculator/ECE/Semester4.dart' as ece;
import 'package:gpa_calculator/ECE/Semester5.dart' as ece;
import 'package:gpa_calculator/ECE/Semester6.dart' as ece;
import 'package:gpa_calculator/ECE/Semester7.dart' as ece;
import 'package:gpa_calculator/ECE/Semester8.dart' as ece;

import 'CGPAScreen.dart';
import 'Utils.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBranch = 0;
  int _selectedPointer = 0;
  int _selectedSemester = 1;
  String _finalPointer = '0.0';
  List<DropdownMenuItem<int>> _semestersDropDownItems;

  updatePointerCallback(String finalPointer) {
    setState(() {
      this._finalPointer = finalPointer;
    });
  }

  @override
  void initState() {
    super.initState();
    _semestersDropDownItems = _getGPADropDownItems();
  }

  @override
  Widget build(BuildContext context) {
    Column mainBodyColumn = Column(
      children: <Widget>[_buildChoices(), _buildSemesterDropDown()],
    );

    if (_selectedPointer == 0) {
      if (_selectedBranch == 0) {
        switch (_selectedSemester) {
          case 1:
            mainBodyColumn.children.add(it.Semester1(updatePointerCallback));
            break;
          case 2:
            mainBodyColumn.children.add(it.Semester2(updatePointerCallback));
            break;
          case 3:
            mainBodyColumn.children.add(it.Semester3(updatePointerCallback));
            break;
          case 4:
            mainBodyColumn.children.add(it.Semester4(updatePointerCallback));
            break;
          case 5:
            mainBodyColumn.children.add(it.Semester5(updatePointerCallback));
            break;
          case 6:
            mainBodyColumn.children.add(it.Semester6(updatePointerCallback));
            break;
          case 7:
            mainBodyColumn.children.add(it.Semester7(updatePointerCallback));
            break;
          case 8:
            mainBodyColumn.children.add(it.Semester8(updatePointerCallback));
            break;
        }
      } else if (_selectedBranch == 1) {
        switch (_selectedSemester) {
          case 1:
            mainBodyColumn.children.add(it.Semester1(updatePointerCallback));
            break;
          case 2:
            mainBodyColumn.children.add(it.Semester2(updatePointerCallback));
            break;
          case 3:
            mainBodyColumn.children.add(ece.Semester3(updatePointerCallback));
            break;
          case 4:
            mainBodyColumn.children.add(ece.Semester4(updatePointerCallback));
            break;
          case 5:
            mainBodyColumn.children.add(ece.Semester5(updatePointerCallback));
            break;
          case 6:
            mainBodyColumn.children.add(ece.Semester6(updatePointerCallback));
            break;
          case 7:
            mainBodyColumn.children.add(ece.Semester7(updatePointerCallback));
            break;
          case 8:
            mainBodyColumn.children.add(ece.Semester8(updatePointerCallback));
            break;
        }
      }
    } else {
      mainBodyColumn.children
          .add(CGPAScreen(_selectedSemester, updatePointerCallback));
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: mainBodyColumn,
    );
  }

  Widget _buildSemesterDropDown() {
    var dropDown = DropdownButtonHideUnderline(
        child: ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton(
        value: _selectedSemester,
        items: _semestersDropDownItems,
        onChanged: _handleSemesterSelection,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
    ));

    var finalPointerWidget = Text(
      '$_finalPointer',
      style: TextStyle(
        fontSize: 32.0,
        color: Colors.deepPurple,
        fontWeight: FontWeight.w500,
      ),
    );

    return Container(
      margin: EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
      padding: EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.grey[400],
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          dropDown,
          finalPointerWidget,
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>> _getGPADropDownItems() {
    return List<DropdownMenuItem<int>>.generate(8, (int index) {
      return DropdownMenuItem<int>(
          value: index + 1,
          child: Text(
            "Semester ${index + 1}",
            softWrap: true,
          ));
    }).toList();
  }

  List<DropdownMenuItem<int>> _getCGPADropDownItems() {
    return List<DropdownMenuItem<int>>.generate(8, (int index) {
      return DropdownMenuItem<int>(
          value: index + 1,
          child: Text(
            index == 0 ? '1 Semester Done' : '${index + 1} Semesters Done',
            softWrap: true,
          ));
    }).toList();
  }

  Widget _buildChoices() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildBranchChoiceChips(),
          VerticalDivider(
            width: 5.0,
            color: Colors.grey,
          ),
          _buildPointerChoiceChips()
        ],
      ),
    );
  }

  Widget _buildBranchChoiceChips() {
    return Wrap(
      spacing: 16,
      children: List<Widget>.generate(2, (int index) {
        return ChoiceChip(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          backgroundColor: Colors.transparent,
          selectedColor: Colors.deepPurpleAccent,
          shape: StadiumBorder(side: BorderSide(color: Colors.deepPurple)),
          pressElevation: 0,
          label: Text(
            branchNames[index],
            style: _selectedBranch == index
                ? TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )
                : TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
          ),
          selected: _selectedBranch == index,
          onSelected: (bool selected) {
            _handleBranchChipSelection(selected, index);
          },
        );
      }).toList(),
    );
  }

  Widget _buildPointerChoiceChips() {
    return Wrap(
      spacing: 16,
      children: List<Widget>.generate(2, (int index) {
        return ChoiceChip(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          selectedColor: Colors.deepPurpleAccent,
          backgroundColor: Colors.transparent,
          shape: StadiumBorder(side: BorderSide(color: Colors.deepPurple)),
          pressElevation: 0,
          label: Text(
            pointer[index],
            style: _selectedPointer == index
                ? TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )
                : TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
          ),
          selected: _selectedPointer == index,
          onSelected: (bool selected) {
            _handlePointerChipSelection(selected, index);
          },
        );
      }).toList(),
    );
  }

  void _handleSemesterSelection(dynamic value) {
    if (_selectedSemester != value as int) {
      setState(() {
        _selectedSemester = value as int;
      });
    }
  }

  void _handleBranchChipSelection(bool selected, int index) {
    if (_selectedBranch != index) {
      setState(() {
        _selectedBranch = selected ? index : 0;
      });
    }
  }

  void _handlePointerChipSelection(bool selected, int index) {
    if (_selectedPointer != index) {
      setState(() {
        _selectedPointer = selected ? index : 0;
        _semestersDropDownItems = _selectedPointer == 0
            ? _getGPADropDownItems()
            : _getCGPADropDownItems();
      });
    }
  }
}
