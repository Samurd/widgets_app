import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.orange,
];

class AppTheme {
  final bool isDarkmode;
  final int selectedColor;

  AppTheme({this.selectedColor = 0, this.isDarkmode = false})
  : assert(selectedColor >= 0 && selectedColor < colorList.length, "Selected Color must be between 0 and ${colorList.length - 1}");

 ThemeData getTheme() => ThemeData(
  brightness: isDarkmode ? Brightness.dark : Brightness.light,
  colorSchemeSeed: colorList[selectedColor],
  appBarTheme: const AppBarTheme(
    centerTitle: false,
  )

  );


  AppTheme copyWith({bool? isDarkmode, int? selectedColor}) => AppTheme(
    isDarkmode: isDarkmode ?? this.isDarkmode,
    selectedColor: selectedColor ?? this.selectedColor,
  );
}