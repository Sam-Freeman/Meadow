import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class DateFormField extends FormField<DateTime> {
    /// An input field which displays a calendar pop up
    /// 
    /// [fieldTitle] : The title, displayed in line with border
    /// [initialValue] : The initial selected date, defaults to current date if none provided
    /// [endDate] : The furthest FUTURE date that can be selected, defaults to current date if none provided
    /// [firstDate] : The furthest PAST date that can be selected, defaults to December 1998 if none provided 
    /// [onSaved] : Returns a string value when form is saved
    /// [validator] : Validator used for validating input
    /// [initialValue] : Starting value, must be included in drop down items
    /// [autovalidate] : Whether the input should be validated after any change

    final DateTime initialValue;

    DateFormField({
        String fieldTitle,
        FormFieldSetter<DateTime> onSaved,
        FormFieldValidator<DateTime> validator,
        DateTime initialValue,
        DateTime endDate,
        DateTime firstDate,
        bool autovalidate = false,
    }) : initialValue = initialValue ?? DateTime.now(),
    super(
        onSaved : onSaved,
        validator : validator,
        initialValue : initialValue,
        autovalidate : autovalidate,
        builder : (FormFieldState<DateTime> state) {
            return _DatePicker(
                labelTitle: fieldTitle,
                selectedDate: state.value,
                startDate: firstDate,
                endDate: endDate,
                dateChanged: (date) => state.didChange(date)
            );
        }
    );
}

/// Creates the pop up, provides call back
class _DatePicker extends StatelessWidget {

    final String labelTitle;
    final DateTime selectedDate;
    final DateTime startDate;
    final DateTime endDate;
    final ValueChanged<DateTime> dateChanged;

    _DatePicker({
        this.labelTitle,
        this.selectedDate,
        this.dateChanged,
        DateTime startDate,
        DateTime endDate,
    }) : startDate = startDate ?? new DateTime(1998, 12),
        endDate = endDate ?? DateTime.now();
        
    Future<Null> _selectDate(BuildContext context) async {
        final DateTime chosenDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: startDate,
            lastDate: endDate
        );
        if (chosenDate != null && chosenDate != selectedDate) {
            dateChanged(chosenDate);
        }
    }

    @override
    Widget build(BuildContext context) {
        return _DatePickerInputField(
            labelText: labelTitle,
            valueText: DateFormat.yMMMd().format(selectedDate),
            icon: Icon(Icons.date_range),
            onPressed: () => _selectDate(context),
        );
    }

}

/// Creates the input field widget
class _DatePickerInputField extends StatelessWidget {

    final String labelText;
    final String valueText;
    final VoidCallback onPressed;
    final Icon icon;

    _DatePickerInputField({
        this.labelText,
        this.valueText,
        this.onPressed,
        this.icon
    });

    @override
    Widget build(BuildContext context) {
        return InkWell(
            onTap: onPressed,
            child: InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: labelText,
                    icon: icon,
                ),
                child: Text(valueText),
            )
        );
    }
}