import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lettutor_mobile_toji/commons/models/tutor_models/tutor_model.dart';

class TutorService {
  static const String _baseUrl = "https://sandbox.api.lettutor.com";

  static Future<List<Tutor>> getTutorsWithPagination(int page, int size, String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/tutor/more?perPage=$size&page=$page'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final jsonDecode = json.decode(response.body);
      final List<dynamic> listTutor = jsonDecode['tutors']["rows"];
      return listTutor.map((tutor) => Tutor.fromJson(tutor)).toList();
    } else {
      final jsonDecode = json.decode(response.body);
      throw Exception(jsonDecode['message']);
    }
  }
}