import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Utils.dart';
import 'WithoutOverScrollShadowBehaviour.dart';

class CGPAScreen extends StatefulWidget {
  final int semestersDone;
  final Function(String) updatePointerCallback;

  CGPAScreen(this.semestersDone, this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _CGPAScreenState();
}

class _CGPAScreenState extends State<CGPAScreen> {
  List<StringBuffer> _gpas;
  List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _gpas = List(widget.semestersDone);
    _controllers = List(widget.semestersDone);
    for (int i = 0; i < widget.semestersDone; ++i) {
      _controllers[i] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < widget.semestersDone; ++i) _controllers[i].dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CGPAScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _gpas = List(widget.semestersDone);
    _controllers = List(widget.semestersDone);
    for (int i = 0; i < widget.semestersDone; ++i) {
      _controllers[i] = TextEditingController();
      _gpas[i] = StringBuffer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ScrollConfiguration(
          behavior: WithoutOverScrollShadowBehaviour(),
          child: ListView.builder(
              itemCount: widget.semestersDone,
              itemBuilder: (BuildContext context, int index) {
                return _createGPAInputField(
                  context,
                  'Semester ${index + 1}',
                  _controllers[index],
                  onChanged: _updateCGPA,
                );
              }),
        ),
      ),
    );
  }

  Widget _createGPAInputField(
      BuildContext context, String hint, TextEditingController controller,
      {ValueChanged<dynamic> onChanged}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300],
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      child: TextField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.caption,
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

  void _updateCGPA(dynamic gpa) {
    for (int i = 0; i < widget.semestersDone; ++i) {
      _gpas[i].clear();
      _gpas[i].write(_controllers[i].text);
    }

    String cgpa = calculateCGPAFor(_gpas, widget.semestersDone);
    print('CGPA: $cgpa');
    widget.updatePointerCallback(cgpa);
  }
}
