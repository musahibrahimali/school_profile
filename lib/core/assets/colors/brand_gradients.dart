import 'package:flutter/material.dart';

class BrandGradients {
  /// all the gradient colors
  final List<Color> colors;
  BrandGradients(this.colors);

  static get sky => [const Color(0xFF6448FE), const Color(0xFF5FC6FF)];
  static get sunset => [const Color(0xFFFE6197), const Color(0xFFFFB463)];
  static get sea => [const Color(0xFF61A3FE), const Color(0xFF63FFD5)];
  static get mango => [const Color(0xFFFFA738), const Color(0xFFFFE130)];
  static get fire => [const Color(0xFFFF5DCD), const Color(0xFFFF8484)];
  static get fireMon => [const Color(0xFFFF5DfD), const Color(0xFFFFA738)];
  static get navbar => [const Color(0xFF122523), const Color(0xFF0A2623)];
  static get darken => [const Color(0xff000000), const Color(0xff000000)];
  static List<Color> nia = [const Color(0xFF51ABD2), const Color(0xFF93CBB8)];
  static List<Color> boarding = [const Color(0xffF06A66), const Color(0xffF88C90)];
  static List<Color> brownish = [const Color(0xffC9725D), const Color(0xffB3596D)];
  static List<Color> card = [const Color.fromRGBO(116, 82, 135, 1), const Color.fromRGBO(82, 171, 210, 1)];
  static List<Color> winning = [const Color(0xffF06A66), const Color(0xffF88C90)];
  static List<Color> second = [const Color(0xFF51ABD2), const Color(0xFF93CBB8)];
  static List<Color> third = [const Color(0xFFAC4F70), const Color(0xFF745387)];
  static List<Color> fourth = [const Color(0xFFD17A58), const Color(0xFFD9B14F)];

  static get primaryIngredientColor => const LinearGradient(
        colors: [Color(0xFFd74747), Color(0xFFC11718)],
        stops: [0, 1],
      );
}
