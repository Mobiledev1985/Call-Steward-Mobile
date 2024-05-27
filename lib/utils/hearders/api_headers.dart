import 'package:call_steward/utils/app_preference/app_preferences.dart';
import 'package:call_steward/utils/app_preference/storage_keys.dart';
import 'package:call_steward/utils/hearders/api_hearders_keys.dart';

class ApiHeaders {
  static Map<String, String> getContextClientIdAndContextRoleIDHeaders() {
    return {
      ApiHeadersKey.contextClientId:
          AppPreferences().sharedPrefRead(StorageKeys.contextClientId),
      ApiHeadersKey.contextRoleId:
          AppPreferences().sharedPrefRead(StorageKeys.contextRole),
    };
  }

  static Map<String, String>
      getContextClientIdAndContextRoleIDAndAffectorHeaders(String employeeId) {
    return {
      ApiHeadersKey.contextClientId:
          AppPreferences().sharedPrefRead(StorageKeys.contextClientId),
      ApiHeadersKey.contextRoleId:
          AppPreferences().sharedPrefRead(StorageKeys.contextRole),
      ApiHeadersKey.affector: employeeId,
      ApiHeadersKey.initiator: employeeId,
    };
  }

  static Map<String, String> getContextClientIdAndEmployeeIdHeaders() {
    return {
      ApiHeadersKey.clientId:
          AppPreferences().sharedPrefRead(StorageKeys.contextClientId),
      ApiHeadersKey.employeeId:
          AppPreferences().sharedPrefRead(StorageKeys.employeeId),
    };
  }
}
