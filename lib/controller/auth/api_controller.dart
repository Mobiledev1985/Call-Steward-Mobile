import 'package:get/get.dart';

class ApiController extends GetxController {
  final List<String> server = [".com", ".ca", ".uk"];
  final RxString _selectedServer = ".com".obs;
  final RxString _selectedServerForDialog = ".com".obs;

  String selectedLanguageCode = "en";

  String get selectedServer => _selectedServer.value;
  set selectedServer(String value) => _selectedServer.value = value;

  String get selectedServerForDialog => _selectedServerForDialog.value;
  set selectedServerForDialog(String value) =>
      _selectedServerForDialog.value = value;
  String get baseUrl => "";

  String get loginUrl => "";

  String get loginAPIParameterUrl => "";
}
