import 'package:flutter/material.dart';

class CheckBoxFormField extends FormField<bool> {
    /// Creates a single check box that can be saved in a form
    /// 
    /// [title] Text that appears next to the checkbox
    /// [activeColor] The color of the checkbox when value is true 
    /// [onSaved] : Returns a string value when form is saved
    /// [validator] : Validator used for validating input
    /// [initialValue] : Starting value, must be included in drop down items
    /// [autovalidate] : Whether the input should be validated after any change
    
    CheckBoxFormField({
        Text title,
        Color activeColor = Colors.green,
        FormFieldSetter<bool> onSaved,
        FormFieldValidator<bool> validator,
        bool initialValue = false,
        bool autovalidate = false,
    }) : super(
        onSaved : onSaved,
        validator : validator,
        autovalidate : autovalidate,
        initialValue : initialValue,
        builder : (FormFieldState<bool> state) {
        return CheckboxListTile(
            activeColor: activeColor,
            title : title,
            value : state.value,
            onChanged: (bool value) => state.didChange(value),
        );
        }
    );
} 