import 'package:flutter/material.dart';

Widget _buildButton({
    String textValue,
    double width,
    FormFieldState<String> state,
    Color selectedColor = Colors.black12,
    Color defaultColor = Colors.white,
    Color selectedBorderColor = Colors.black,
    Color defaultBorderColor = Colors.black45,
}) {
    return InkWell(
        onTap: () => state.didChange(textValue),
        child: Container(
            decoration: BoxDecoration(
                color: (state.value == textValue) ? selectedColor : defaultColor,
                borderRadius: BorderRadius.circular(8.0),
                border: (state.value == textValue) ? Border.all(color: selectedBorderColor, width: 2.0) : Border.all(color: defaultBorderColor, width: 1.0),
            ),
            width: width,
            alignment: Alignment.center,
            child: Text(textValue),
        ),
    );
}

class ButtonRowFormField extends FormField<String> {

    ButtonRowFormField({
        @required double rowWidth,
        @required List<String> buttonValues,
        String title,
        Icon icon,
        double spaceBetweenButtons = 20.0,
        double buttonHeight = 50.0,
        FormFieldSetter<String> onSaved,
        FormFieldValidator<String> validator,
        bool autovalidate = false,
        String initialValue = "",
    }) : super(
        onSaved : onSaved,
        validator : validator,
        initialValue : initialValue,
        autovalidate : autovalidate,
        builder : (FormFieldState<String> state) {
            return SizedBox(
                height: buttonHeight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(buttonValues.length, (int index) {
                        return Row(
                            children: [
                                _buildButton(
                                    textValue: buttonValues[index],
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