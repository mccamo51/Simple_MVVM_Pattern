import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mvvm_test/model/postModel.dart';
import 'package:mvvm_test/services/api_status.dart';

class PostService {
  static Future<Object> getPost() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var resonseData = postModelFromJson(response.body);

        return Success(code: response.statusCode, response: resonseData);
      }
      return Failed(code: response.statusCode, response: "Error Request");
    } on HttpException {
      return Failed(code: 110, response: "Invalid");
    } on TimeoutException {
      return Failed(code: 112, response: "Timeout");
    } on SocketException {
      return Failed(code: 113, response: "No Internet");
    } on FormatException {
      return Failed(code: 113, response: "Format Error");
    } on TypeError {
      return Failed(code: 113, response: "Format Error");
    } catch (e) {
      return Failed(code: 111, response: "Unknown Error");
    }
  }
}
