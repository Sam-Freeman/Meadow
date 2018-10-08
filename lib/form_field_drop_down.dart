import 'package:flutter/material.dart';

class DropDownFormField<T> extends FormField<T> {
  /// Creates a drop down field that can be easily used within a form
  ///
  /// [dropDownItems] : Drop down options
  /// [fieldTitle] : Form label title, displayed inline with border
  /// [prefixIcon] : Icon displayed within form field bounds
  /// [icon] : Icon Displayed before inline with the form field, outside of bounds
  /// [onSaved] : Returns a string value when form is saved
  /// [validator] : Validator used for validating input
  /// [initialValue] : Starting value, must be included in drop down items
  /// [autovalidate] : Whether the input should be validated after any change

  DropDownFormField({
    @required List<T> dropDownValues,
    String fieldTitle,
    Icon prefixIcon,
    Icon icon,
    FormFieldSetter<T> onSaved,
    FormFieldValidator<T> validator,
    String initialValue = "",
    bool autovalidate = false,
  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: dropDownValues[0],
            autovalidate: autovalidate,
            builder: (FormFieldState<T> state) {
              return InputDecorator(
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: prefixIcon,
                    icon: icon,
                    errorText: state.hasError ? state.errorText : null,
                    errorBorder: state.hasError
                        ? OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1.0))
                        : null,
                    border: OutlineInputBorder(),
                    labelText: fieldTitle,
                  ),
                  isEmpty: state.value == "",
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: state.value,
                          isDense: true,
                          onChanged: (newValue) => state.didChange(newValue),
                          items: dropDownValues
                              .map((value) => DropdownMenuItem(
                                  value: value, child: Text(value.toString())))
                              .toList())));
            });
}
