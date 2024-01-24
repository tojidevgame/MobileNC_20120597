import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor_mobile_toji/models/token_models.dart';
import 'package:lettutor_mobile_toji/models/user_model.dart';

// create AuthServices class
import 'package:lettutor_mobile_toji/providers/authprovider.dart';

class AuthServices {
  static const String url = 'https://sandbox.api.lettutor.com';

  static loginWithEmailAndPassword(
      String email,
      String password,
      AuthProvider authProvider,
      Function(User, Tokens, AuthProvider) callback) async {
    final response = await http.post(Uri.parse("$url/auth/login"),
        body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      final jsonDecode = json.decode(response.body);
      final tokens = Tokens.fromJson(jsonDecode["tokens"]);
      final user = User.fromJson(jsonDecode["user"]);
      await callback(user, tokens, authProvider);
      return true;
    } else {
      final jsonRes = json.decode(response.body);
      print(jsonRes["message"]);
      throw Exception(jsonRes["message"]);
    }
  }

  static registerWithEmailAndPassword(String email, String password, Function() callback) async {
    final response = await http.post(Uri.parse("$url/auth/register"), body: {
      'email': email,
      'password': password,
      "source": "null",
    });

    if (response.statusCode == 201) {
      await callback();
    } else {
      final jsonRes = json.decode(response.body);
      throw Exception(jsonRes["message"]);
    }
  }

  static Future<bool> forgotPassword(String email) async {
    final response =
        await http.post(Uri.parse(url + "/user/forgotPassword"), body: {
      'email': email,
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      final jsonRes = json.decode(response.body);
      throw Exception(jsonRes["message"]);
    }
  }
}
