import 'package:flutter/material.dart';

class SystemColors {
 static const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE9E7EC),
  100: Color(0xFFC8C2D0),
  200: Color(0xFFA499B0),
  300: Color(0xFF7F7090),
  400: Color(0xFF635279),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF412E59),
  700: Color(0xFF38274F),
  800: Color(0xFF302045),
  900: Color(0xFF211433),
});
static const int _primaryPrimaryValue = 0xFF483361;

static const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFA974FF),
  200: Color(_primaryAccentValue),
  400: Color(0xFF6A0EFF),
  700: Color(0xFF5D00F3),
});
static const int _primaryAccentValue = 0xFF8A41FF;

static const MaterialColor accent = MaterialColor(_accentPrimaryValue, <int, Color>{
  50: Color(0xFFFFE4E4),
  100: Color(0xFFFFBCBC),
  200: Color(0xFFFF8F8F),
  300: Color(0xFFFE6262),
  400: Color(0xFFFE4141),
  500: Color(_accentPrimaryValue),
  600: Color(0xFFFE1B1B),
  700: Color(0xFFFE1717),
  800: Color(0xFFFE1212),
  900: Color(0xFFFD0A0A),
});
static const int _accentPrimaryValue = 0xFFFE1F1F;

static const MaterialColor accentAccent = MaterialColor(_accentAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_accentAccentValue),
  400: Color(0xFFFFC0C0),
  700: Color(0xFFFFA7A7),
});
static const int _accentAccentValue = 0xFFFFF3F3;

static const MaterialColor primarylight = MaterialColor(_primarylightPrimaryValue, <int, Color>{
  50: Color(0xFFEFEDF2),
  100: Color(0xFFD7D1DE),
  200: Color(0xFFBCB3C9),
  300: Color(0xFFA195B3),
  400: Color(0xFF8D7EA2),
  500: Color(_primarylightPrimaryValue),
  600: Color(0xFF715F8A),
  700: Color(0xFF66547F),
  800: Color(0xFF5C4A75),
  900: Color(0xFF493963),
});
static const int _primarylightPrimaryValue = 0xFF796792;

static const MaterialColor primarylightAccent = MaterialColor(_primarylightAccentValue, <int, Color>{
  100: Color(0xFFD2B6FF),
  200: Color(_primarylightAccentValue),
  400: Color(0xFF9350FF),
  700: Color(0xFF8336FF),
});
static const int _primarylightAccentValue = 0xFFB283FF;
}
