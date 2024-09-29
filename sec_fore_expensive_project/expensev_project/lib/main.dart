import "package:expensev_project/widget/expenses.dart";
import "package:flutter/material.dart";

// ignore: non_constant_identifier_names
var Kcolor =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var darkColor =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 41, 30, 67));
void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: darkColor,
      cardTheme: const CardTheme().copyWith(
        color: Kcolor.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: Kcolor,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Kcolor.onPrimaryContainer,
          foregroundColor: Kcolor.primaryContainer, //لون النص
        ),
        cardTheme: const CardTheme().copyWith(
          color: Kcolor.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Kcolor.primaryContainer,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: TextStyle(
              color: Kcolor.onSecondaryContainer,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        )),
    home: const Expenses(),
  ));
}
