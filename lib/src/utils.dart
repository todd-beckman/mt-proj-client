import 'package:color/color.dart';
import 'package:meta/meta.dart' show required;

/// An enumeration of the colors that should be used by MT
class MTColor {
  Color get color => _color;
  Color _color;
  MTColor({@required Color color}) : _color = color;

  String toCssString() => _color.toHexColor().toCssString();

  static final MTColor BLACK = new MTColor(color: new Color.hex('#000000'));
  static final MTColor RED = new MTColor(color: new Color.hex('#B02020'));
}

/// Returns the URL to the GET endpoint on the doc server for documents
String getDocUrl(String root, String docId) => '$root/doc/$docId';

/// Returns the URL to the POST endpoint on the doc server for documents
String postDocUrl(String root, String docId) => '$root/doc/$docId';
