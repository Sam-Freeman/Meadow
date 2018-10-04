import 'package:flutter/material.dart';

class SliderFormField<T> extends FormField<T> {
    SliderFormField({
        @required int min,
        @required int max,
        int divisions = 1,

    }) : super();
}