import 'package:color/color.dart';

/// An enumeration of the colors that should be used by MT
class MTColor {
  Color get color => _color;
  Color _color;
  MTColor(Color color) : _color = color;

  String toCssString() => _color.toHexColor().toCssString();

  static final MTColor BLACK = new MTColor(new Color.hex('#000000'));
  static final MTColor RED = new MTColor(new Color.hex('#B02020'));
}
