import 'package:flutter/material.dart';



class RadioButtonsFormField<T> extends FormField<T> {
    /// Creates a row of Radio Buttons, where one can be selected
    /// 
    /// [rowWidth] : The width of the area to be taken up by the row, such as: [MediaQuery.of(context).size.width]
    /// [values] : a list of values that will be used by the radio button - also its label
    /// [spaceBetweenTiles] : Determines the space between each radio tile
    /// [activeColor] The color of the checkbox when value is true  
    /// [onSaved] : Returns a string value when form is saved
    /// [validator] : Validator used for validating input
    /// [initialValue] : Starting value, must be included in drop down items
    /// [autovalidate] : Whether the input should be validated after any change

    RadioButtonsFormField({
        @required double rowWidth,
        @required List<T> values,
        double spaceBetweenTiles = 20.0,
        Color activeColor = Colors.green,
        FormFieldSetter<T> onSaved,
        FormFieldValidator<T> validator,
        bool autovalidate = false,
    }) : super(
      onSaved : onSaved,
      validator : validator,
      initialValue : null,
      autovalidate : autovalidate,
      builder : (FormFieldState<T> state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(values.length, (int index) {
            return SizedBox(
              width: (rowWidth - (values.length * spaceBetweenTiles)) / (values.length),
              child: RadioListTile(
                activeColor: activeColor,
                controlAffinity: ListTileControlAffinity.platform,
                title: Text(values[index].toString()),
                value: values[index],
                groupValue: state.value,
                onChanged: (T newValue) => state.didChange(newValue),
              )
            );
          })
        );
      }
    );
}