import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xfffa8900, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xfffb951a), //10%
      100: const Color(0xfffba133), //20%
      200: const Color(0xfffcac4d), //30%
      300: const Color(0xfffcb866), //40%
      400: const Color(0xfffdc480), //50%
      500: const Color(0xfffdd099), //60%
      600: const Color(0xfffedcb3), //70%
      700: const Color(0xfffee7cc), //80%
      800: const Color(0xfffff3e6), //90%
      900: const Color(0xffffffff), //100%
    },
  );
}
