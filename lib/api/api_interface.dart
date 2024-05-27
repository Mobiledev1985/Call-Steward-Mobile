abstract class ApiCallBacks {
  void onSuccess(dynamic object, String strMsg, String apiEndPoint);

  void onError(String errorMsg, String apiEndPoint);

  void onConnectionError(String error, String apiEndPoint);

  void onLoading(bool isLoading, String apiEndPoint);
}
