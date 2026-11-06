import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiController {
    saveToken({required String token}) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.setString('token', token);
    }

    reteriveToken() async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getString("token") ?? '';
    }

    //POST
    Future<(int, String)> post({
        required String url,
        required Map<String, String> body,
        bool isToken = false,
    }) async {
        var myheader = {'Content-Type': 'application/json'};
        if (isToken) {
            String token = await reteriveToken();
            myheader.addAll({'Authorization': 'Bearer $token'});
        }
        var myBody = jsonEncode(body);
        Uri uri = Uri.parse(url);
        try {
            var response = await http.post(uri, headers: myheader, body: myBody);
            return (response.statusCode, response.body);
        } catch (e) {
            return (600, 'Something went wrong');
        }
    }

    //GET
    Future<(int, String)> get({required String url, bool isToken = false}) async {
        Map<String, String> myheader = {};
        if (isToken) {
            String token = await reteriveToken();
            myheader.addAll({'Authorization': 'Bearer $token'});
        }
        Uri uri = Uri.parse(url);
        try {
            var response = await http.get(uri, headers: myheader);
            return (response.statusCode, response.body);
        } catch (e) {
            return (600, 'Something went wrong');
        }
    }
}