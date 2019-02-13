import 'package:flutter/material.dart';

const branchNames = ['IT', 'ECE'];
const pointer = ['GPA', 'CGPA'];

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedBranch = 0;
  var _selectedPointer = 0;
  var _selectedSemester = 1;
  var _semesterDropDownLabel = 'Semester';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildChoices(),
          _buildSemesterDropDown(),
        ],
      ),
    );
  }

  Widget _buildSemesterDropDown() {
    var selectSemesterLabel = Text(
      '$_semesterDropDownLabel',
      style: Theme.of(context).textTheme.title,
    );

    var semesters = List<DropdownMenuItem>.generate(8, (int index) {
      return DropdownMenuItem(
          value: index + 1,
          child: Text(
            "Semester ${index + 1}",
            softWrap: true,
          ));
    });

    var dropDown = Container(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[50],
        ),
        child: DropdownButtonHideUnderline(
            child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            value: _selectedSemester,
            items: semesters,
            onChanged: _handleSemesterSelection,
            style: Theme.of(context).textTheme.title,
          ),
        )),
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(
          color: Colors.grey[400],
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[selectSemesterLabel, dropDown],
      ),
    );
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
        _semesterDropDownLabel =
            _selectedPointer == 0 ? 'Semester' : 'Semesters Done';
      });
    }
  }
}
