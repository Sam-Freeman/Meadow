import 'package:flutter/material.dart';

class ButtonRowFormField<T> extends FormField<T> {
    /// Creates a row of buttons, where one can be selected
    ///
    /// [rowWidth] : The width of the area to be taken up by the row, such as: [MediaQuery.of(context).size.width]
    /// [buttonValue] : The text of each button - size determines the number of buttons
    /// [spaceBetweenButtons] : Determines the space between each button
    /// [buttonHeight] : The height of each button
    /// [onSaved] : Returns a string value when form is saved
    /// [validator] : Validator used for validating input
    /// [initialValue] : Starting value, must be included in drop down items
    /// [autovalidate] : Whether the input should be validated after any change
    /// [selectedColor] : A [Color] value that is displayed behind the text when a button is chosen 
    /// [selectedBorderColor] : A [Color] value for the border that is displayed when a button is chosen   
    /// [defaultColor] : A [Color] value that is displayed when a button has not been selected
    /// [defaultBorderColor] : A [Color] value for the border that is displayed when a button is not selected    

    ButtonRowFormField({
        @required double rowWidth,
        @required List<T> buttonValues,
        double spaceBetweenButtons = 20.0,
        double buttonHeight = 50.0,
        FormFieldSetter<T> onSaved,
        FormFieldValidator<T> validator,
        bool autovalidate = false,
        Color selectedColor = Colors.black12,
        Color selectedBorderColor = Colors.black,
        Color defaultColor = Colors.white,
        Color defaultBorderColor = Colors.black45,
    }) : super(
        onSaved: onSaved,
        validator: validator,
        initialValue: null,
        autovalidate: autovalidate,
        builder: (FormFieldState<T> state) {
            return SizedBox(
            height: buttonHeight,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(buttonValues.length, (int index) {
                    return Row(children: [
                        _buildButton(
                            contentValue: buttonValues[index],
                            width: (rowWidth -
                                    (buttonValues.length *
                                        spaceBetweenButtons)) /
                                (buttonValues.length),
                            state: state,
                            defaultBorderColor: defaultBorderColor,
                            defaultColor: defaultColor,
                            selectedBorderColor: selectedBorderColor,
                            selectedColor: selectedColor),
                        SizedBox(
                            width: (index != buttonValues.length - 1)
                                ? spaceBetweenButtons
                                : 0.0,
                        )
                    ]);
                })),
            );
        });
}

/// Widget used to create each button
Widget _buildButton<T>({
  T contentValue,
  double width,
  FormFieldState<T> state,
  Color selectedColor,
  Color defaultColor,
  Color selectedBorderColor,
  Color defaultBorderColor,
}) {
  return InkWell(
    onTap: () => state.didChange(contentValue),
    child: Container(
      decoration: BoxDecoration(
        color: (state.value == contentValue) ? selectedColor : defaultColor,
        borderRadius: BorderRadius.circular(8.0),
        border: (state.value == contentValue)
            ? Border.all(color: selectedBorderColor, width: 2.0)
            : Border.all(color: defaultBorderColor, width: 1.0),
      ),
      width: width,
      alignment: Alignment.center,
      child: Text(contentValue.toString()),
    ),
  );
}
