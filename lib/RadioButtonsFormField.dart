import 'package:flutter/material.dart';

class RadioButtonsFormField<T> extends FormField<T> {

    RadioButtonsFormField({
        @required List<T> values,
        FormFieldSetter<T> onSaved,
        FormFieldValidator<T> validator,
        bool autovalidate = false
    }) : super(
      onSaved : onSaved,
      validator : validator,
      initialValue : null,
      autovalidate : autovalidate,
      builder : (FormFieldState<T> state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(values.length, (int index) {
            return RadioListTile(
              title: Text(values[index].toString()),
              value: values[index],
              groupValue: state.value,
              onChanged: (T newValue) => state.didChange(newValue),
            );
          })
        );
      }
    );
}