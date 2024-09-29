import 'dart:html';

import "package:flutter/material.dart";
import 'package:expenses_tracker/expenses.dart';

var KcolorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 73, 40, 149));
var KcolorSchemeDark = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(255, 8, 56, 69));

void main() {
  runApp(
    MaterialApp(
        darkTheme: ThemeData.dark()
            .copyWith(useMaterial3: true, colorScheme: KcolorSchemeDark),
        theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: KcolorScheme,
            appBarTheme: const AppBarTheme().copyWith(
              foregroundColor: KcolorScheme.primaryContainer,
              color: KcolorScheme.onPrimaryContainer,
            ),
            cardTheme: const CardTheme().copyWith(
                color: KcolorScheme.secondaryContainer,
                margin:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: KcolorScheme.primaryContainer,
                  foregroundColor: KcolorScheme.onPrimaryContainer),
            ),
            textTheme: TextTheme(
              
            
                bodyMedium: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: KcolorScheme.onSecondaryContainer),
                bodyLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: KcolorScheme.onSecondaryContainer),
                bodySmall: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: KcolorScheme.onSecondaryContainer),
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: KcolorScheme.onSecondaryContainer),
                titleMedium: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: KcolorScheme.onSecondaryContainer))),
        themeMode: ThemeMode.system,
        home: const Expenses()),
  );
}
//ColorScheme تدرجات الوان من نوع اللون الي بتحطه
// KcolorScheme.onPrimaryContainer :بيعطيك اللون الي انت دهلته اللون الرئيسي 
// foregroundColor: KcolorScheme.primaryContainer :بيعطيك اخر تدرج للون الي انت جطيته