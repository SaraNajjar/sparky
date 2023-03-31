import 'package:get/get.dart';
import '../translation/arabic.dart';
import '../translation/english.dart';

class MyLocal implements Translations{
  @override

  Map<String, Map<String, String>> get keys => {
    'en':en,
    'ar':ar
  };

}