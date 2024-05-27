import 'dart:async';
import 'dart:io';

import 'api_interface.dart';

class HttpExceptionHandler {
  // Handle APIs error and exceptions
  static void onException(e, ApiCallBacks apiCallBacks, String apiEndPoint) {
    switch (e.runtimeType) {
      case TimeoutException:
        apiCallBacks.onError("API not responded in time", apiEndPoint);
        break;
      case SocketException:
        apiCallBacks.onError("Can't connect to server", apiEndPoint);
        break;
      case FormatException:
        apiCallBacks.onError("Something went wrong", apiEndPoint);
        break;
      default:
        apiCallBacks.onError(e.toString(), apiEndPoint);
        break;
    }
  }
}
