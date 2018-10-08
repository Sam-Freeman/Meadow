import 'package:flutter/material.dart';
import 'package:meadow/meadow.dart';

class ExampleMeadowFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.025),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: ListView(children: [ExampleMeadowForm()]))));
  }
}

class _ExampleModel {
  String mButtonRowTwoString;
  int mButtonRowTwoInt;
  String mButtonRowThree;
  String mRadio;
  DateTime mDatePicker;
  bool mSwitch;
  bool mCheckBox;

  @override
  String toString() {
    return "Two Button String: " +
        mButtonRowTwoString +
        ", "
        "Two Button Int: " +
        mButtonRowTwoInt.toString() +
        ", "
        "Three Button: " +
        mButtonRowThree +
        ", "
        "Radio: " +
        mRadio +
        ", "
        "Date: " +
        mDatePicker.toString() +
        ", "
        "Switch: " +
        mSwitch.toString() +
        ", "
        "Check Box: " +
        mCheckBox.toString() +
        ", ";
  }
}

class ExampleMeadowForm extends StatefulWidget {
  @override
  createState() => _ExampleMeadowFormState();
}

class _ExampleMeadowFormState extends State<ExampleMeadowForm> {
  final _formKey = GlobalKey<FormState>();
  final TextStyle _style = TextStyle(fontSize: 14.0, letterSpacing: 1.4);
  final _ExampleModel _formData = _ExampleModel();

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(_formData.toString())));
    }
  }

  Widget _header(String text) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Text(text, style: _style));
  }

  @override
  Widget build(BuildContext context) {
    final double _maxWidth = MediaQuery.of(context).size.width * 0.95;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _header("Button Row - 2 Buttons, Strings"),
          ButtonRowFormField(
            rowWidth: _maxWidth,
            buttonValues: ["One", "Two"],
            selectedColor: Colors.lightGreen,
            selectedBorderColor: Colors.green,
            onSaved: (value) => _formData.mButtonRowTwoString = value,
          ),
          _header("Button Row - 2 Buttons, Integers"),
          ButtonRowFormField(
            rowWidth: _maxWidth,
            buttonValues: [1, 2],
            selectedColor: Colors.lightGreen,
            selectedBorderColor: Colors.green,
            onSaved: (value) => _formData.mButtonRowTwoInt = value,
          ),
          _header("Button Row - 3 Buttons"),
          ButtonRowFormField(
            rowWidth: _maxWidth,
            buttonValues: ["One", "Two", "Three"],
            selectedColor: Colors.lightGreen,
            selectedBorderColor: Colors.green,
            onSaved: (value) => _formData.mButtonRowThree = value,
          ),
          _header("Radio Buttons"),
          RadioButtonsFormField(
            rowWidth: _maxWidth,
            values: ["a", "b"],
            onSaved: (value) => _formData.mRadio = value,
          ),
          _header("Date Picker"),
          DateFormField(
            firstDate: DateTime(2018, 2),
            onSaved: (value) => _formData.mDatePicker = value,
          ),
          _header("Switch"),
          SwitchFormField(
              title: Text("This is a Switch"),
              onSaved: (value) => _formData.mSwitch = value),
          _header("Checkbox"),
          CheckBoxFormField(
              title: Text("This is a Checkbox "),
              onSaved: (value) => _formData.mCheckBox = value),
          SizedBox(height: 20.0),
          FlatButton(
            child: Text("Submit"),
            onPressed: () => _submitForm(),
          )
        ],
      ),
    );
  }
}
