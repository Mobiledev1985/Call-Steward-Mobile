import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:call_steward/localization/en_US.dart';
import 'package:call_steward/localization/es_ES.dart';
import 'package:call_steward/localization/fr_CA.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': en_us, 'es_ES': es_ES, 'fr_CA': fr_CA};
}
