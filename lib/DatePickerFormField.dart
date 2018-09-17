import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';


class DateFormField extends FormField<DateTime> {
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
    }) : startDate = startDate ?? new DateTime(2000, 8),
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