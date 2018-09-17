import 'package:flutter/material.dart';

class DropDownFormField extends FormField<String> {
        DropDownFormField({
        @required List<String> dropDownItems,
        String fieldTitle,
        Icon prefixIcon,
        Icon icon,
        FormFieldSetter<String> onSaved,
        FormFieldValidator<String> validator,
        String initialValue = "",
        bool autovalidate = false,

    }) : super(
        onSaved : onSaved,
        validator : validator,
        initialValue : initialValue,
        autovalidate : autovalidate,
        builder : (FormFieldState<String> state) {
            return InputDecorator(
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: prefixIcon,
                    icon: icon,
                    errorText: state.hasError ? state.errorText : null,
                    errorBorder: state.hasError ? OutlineInputBorder(borderSide: const BorderSide(color: Colors.red, width: 1.0)) : null,
                    border: OutlineInputBorder(),
                    labelText: fieldTitle,
                ),
                isEmpty: state.value == "",
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: state.value,
                        isDense: true,
                        onChanged: (newValue) => state.didChange(newValue),
                        items: dropDownItems.map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value)
                        )).toList()
                    )
                )
            );
        }
    );

}