import 'package:flutter/material.dart';
import 'meadow.dart';

class ExampleMeadowFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
         minimum: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.025),
         child: SizedBox(
           width: MediaQuery.of(context).size.width * 0.95,
           child: ListView(
             children: [
               _ExampleMeadowForm()
             ]
           )
         )
      )
    );
  }
}

class _ExampleMeadowForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  void _submitForm() {

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Button Row"
          ),
          ButtonRowFormField(
            rowWidth: MediaQuery.of(context).size.width * 0.95,
            buttonValues: ["One", "Two"],
            title: "2 Buttons"
          ),
          ButtonRowFormField(
            rowWidth: MediaQuery.of(context).size.width * 0.95,
            buttonValues: ["One", "Two", "Three"],
            title: "3 Buttons"
          ),
          DropDownFormField(
            fieldTitle: "Drop Down",
            dropDownItems: ["", "One", "Two", "Three"],
          ),
          DateFormField(fieldTitle: "Date",)
        ],
      ), 
    );
  }
}

class _ExampleModel {

}