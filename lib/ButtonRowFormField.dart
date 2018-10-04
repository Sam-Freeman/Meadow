import 'package:flutter/material.dart';

/// Creates a row of buttons, where one can be selected
/// 
/// [rowWidth] : The width of the area to be taken up by the row, such as: [MediaQuery.of(context).size.width]
/// [buttonValue] : The text of each button - size determines the number of buttons
/// [title] : Title displayed above the row of buttons
/// [icon] : Displayed next to the title
/// [spaceBetweenButtons] : Determines the space between each button
/// [buttonHeight] : The height of each button
/// [onSaved] : Returns a string value when form is saved
/// [validator] : Validator used for validating input
/// [initialValue] : Starting value, must be included in drop down items
/// [autovalidate] : Whether the input should be validated after any change
class ButtonRowFormField<T> extends FormField<T> {
    ButtonRowFormField({
        @required double rowWidth,
        @required List<T> buttonValues,
        String title,
        Icon icon,
        double spaceBetweenButtons = 20.0,
        double buttonHeight = 50.0,
        FormFieldSetter<T> onSaved,
        FormFieldValidator<T> validator,
        bool autovalidate = false,
    }) : super(
        onSaved : onSaved,
        validator : validator,
        initialValue : null,
        autovalidate : autovalidate,
        builder : (FormFieldState<T> state) {
            return SizedBox(
                height: buttonHeight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(buttonValues.length, (int index) {
                        return Row(
                            children: [
                                _buildButton(
                                    contentValue: buttonValues[index],
                                    width: (rowWidth - (buttonValues.length * spaceBetweenButtons)) / (buttonValues.length),
                                    state: state
                                ),
                                SizedBox(width: (index != buttonValues.length - 1) ? spaceBetweenButtons : 0.0,)
                            ]
                        );
                    })
                ),
            );
        }
    );

}

/// Widget used to create each button
Widget _buildButton<T>({
    T contentValue,
    double width,
    FormFieldState<T> state,
    Color selectedColor = Colors.black12,
    Color defaultColor = Colors.white,
    Color selectedBorderColor = Colors.black,
    Color defaultBorderColor = Colors.black45,
}) {
    return InkWell(
        onTap: () => state.didChange(contentValue),
        child: Container(
            decoration: BoxDecoration(
                color: (state.value == contentValue) ? selectedColor : defaultColor,
                borderRadius: BorderRadius.circular(8.0),
                border: (state.value == contentValue) ? Border.all(color: selectedBorderColor, width: 2.0) : Border.all(color: defaultBorderColor, width: 1.0),
            ),
            width: width,
            alignment: Alignment.center,
            child: Text(contentValue.toString()),
        ),
    );
}