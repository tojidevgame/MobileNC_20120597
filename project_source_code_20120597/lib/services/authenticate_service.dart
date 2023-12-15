import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor_mobile_toji/commons/models/token_models.dart';
import 'package:lettutor_mobile_toji/commons/models/user_model/user_model.dart';

// create AuthServices class
import 'package:lettutor_mobile_toji/features/authen/provider/authprovider.dart';

class AuthServices {
  static const String url = 'https://sandbox.api.lettutor.com';

  static loginWithEmailAndPassword(String email, String password, AuthProvider authProvider, Function(User, Tokens, AuthProvider) callback) async {
    final response = await http.post(Uri.parse("$url/auth/login"), body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      final jsonDecode = json.decode(response.body);
      print( "Data ${jsonDecode["user"]}");
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
}