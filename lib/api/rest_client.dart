import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:call_steward/utils/app_preference/storage_keys.dart';
import '../controller/auth/api_controller.dart';
import '../utils/utilities.dart';
import '../utils/app_preference/app_preferences.dart';
import 'api_interface.dart';
import 'http_exception.dart';

enum RequestType { post, put, get, delete, uploadImage, uploadMultipleImage }

class RestClient {
  final ApiCallBacks _apiCallBacks;

  RestClient(this._apiCallBacks);

  /* Call api using http request
  * @param context
  * @param requestType - GET,POST,DELETE...
  * @param requestParams - Pass api request parameters (Body)
  * @param apiEndPoint - In which form data is return from api (Object or Array)
  * @param responseListener - Callback to handle api response
  * */

  Future<void> apiCall(
      {Map requestParam = const {},
      String apiEndPoint = "",
      RequestType requestType = RequestType.get,
      bool isLoading = true,
      String queryParams = '',
      bool needAuthorazation = true,
      File? profileImage,
      String? imageName,
      List<File>? imageList,
      Map<String, String> extraHeader = const {},
      bool needToJsonDecode = true}) async {
    bool isInternet = await Utilities.isConnectedNetwork();
    if (!isInternet) {
      _apiCallBacks.onConnectionError(
          "Check your internet connection and try again", apiEndPoint);
    } else {
      _apiCallBacks.onLoading(isLoading, apiEndPoint);

      late http.Response response;

      //time out of the API
      const Duration timeOut = Duration(seconds: 30);

      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        'Authorization': needAuthorazation
            ? 'Bearer ${AppPreferences().sharedPrefRead(StorageKeys.token)}'
            : ""
      };

      headers.addEntries(extraHeader.entries);

      String url = Get.find<ApiController>().baseUrl + apiEndPoint;

      if (queryParams.isNotEmpty) {
        url += queryParams;
      }

      log("Request Param : $url + " " + $requestParam");
      try {
        switch (requestType) {
          case RequestType.post:
            response = await http
                .post(Uri.parse(url),
                    headers: headers, body: json.encode(requestParam))
                .timeout(timeOut);
            break;

          case RequestType.put:
            response = await http
                .put(Uri.parse(url),
                    headers: headers, body: json.encode(requestParam))
                .timeout(timeOut);
            break;

          case RequestType.get:
            response = await http
                .get(Uri.parse(url), headers: headers)
                .timeout(timeOut);
            break;

          case RequestType.delete:
            response = await http
                .delete(Uri.parse(url), headers: headers)
                .timeout(timeOut);
            break;

          case RequestType.uploadImage:
            var uri = Uri.parse(url);
            http.MultipartRequest request =
                await uploadImageRequest(uri, profileImage, imageName);
            var response = await request.send().timeout(timeOut);
            response.stream.transform(utf8.decoder).listen((jsonResponse) {
              handleResponse(
                  response,
                  queryParams.isNotEmpty ? url : apiEndPoint,
                  jsonResponse,
                  needToJsonDecode);
            });
            return;

          case RequestType.uploadMultipleImage:
            var uri = Uri.parse(url);
            var request = await uploadMultipleImage(uri, imageList!, imageName);
            var response = await request.send().timeout(timeOut);
            response.stream.transform(utf8.decoder).listen((jsonResponse) {
              handleResponse(
                  response,
                  queryParams.isNotEmpty ? url : apiEndPoint,
                  jsonResponse,
                  needToJsonDecode);
            });
            return;
        }
        handleResponse(response, queryParams.isNotEmpty ? url : apiEndPoint,
            response.body, needToJsonDecode);
      } catch (e) {
        HttpExceptionHandler.onException(e, _apiCallBacks, apiEndPoint);
      } finally {
        _apiCallBacks.onLoading(
            false, queryParams.isNotEmpty ? url : apiEndPoint);
      }
    }
  }

  void handleResponse(response, String apiEndPoint, String jsonResponse,
      bool needToJsonDecode) {
    dynamic responseBody;
    if (needToJsonDecode) {
      responseBody = json.decode(jsonResponse);
    } else {
      responseBody = jsonResponse;
    }
    if (response.statusCode == HttpStatus.unauthorized) {
      AppPreferences().sharedPrefEraseAllData();
      Utilities.tokenExpiredDialog();
      throw response.body;
    }
    if (response.statusCode != HttpStatus.ok &&
            response.statusCode != HttpStatus.created ||
        responseBody == null) {
      throw 'Somthing went wrong';
    } else {
      _apiCallBacks.onSuccess(responseBody, 'success', apiEndPoint);
    }
  }

  Future<http.MultipartRequest> uploadImageRequest(
      Uri uri, File? profileImage, String? imageName) async {
    var request = http.MultipartRequest("POST", uri);
    Map<String, String> headers = {};
    request.headers.addAll(headers);
    if (profileImage != null) {
      var stream = http.ByteStream(profileImage.openRead());
      var length = await profileImage.length();
      var multipartFile = http.MultipartFile(imageName!, stream, length,
          filename: basename(profileImage.path));
      request.files.add(multipartFile);
    }
    return request;
  }

  Future<http.MultipartRequest> uploadMultipleImage(
      Uri uri, List<File> imageList, String? imageName) async {
    var request = http.MultipartRequest("POST", uri);
    Map<String, String> headers = {};
    request.headers.addAll(headers);
    if (imageList.isNotEmpty) {
      for (int i = 0; i < imageList.length; i++) {
        var stream = http.ByteStream(imageList[i].openRead());
        var length = await imageList[i].length();
        var multipartFile = http.MultipartFile(imageName!, stream, length,
            filename: basename(imageList[i].path));
        request.files.add(multipartFile);
      }
    }
    return request;
  }
}
