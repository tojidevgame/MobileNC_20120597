import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lettutor_mobile_toji/models/tutor_detail_info_model.dart';
import 'package:lettutor_mobile_toji/models/tutor_model.dart';

class TutorService {
  static const String _baseUrl = "https://sandbox.api.lettutor.com";

  static Future<List<Tutor>> getTutorsWithPagination(
      int page, int size, String token) async {
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

  static Future<List<Tutor>> searchTutor(
    int page,
    int perPage,
    String token, {
    String search = "",
    List<String> specialties = const [],
  }) async {
    final Map<String, dynamic> args = {
      "page": page,
      "perPage": perPage,
      "search": search,
      "filters": {
        "specialties": specialties,
      },
    };

    final response = await http.post(
      Uri.parse("$_baseUrl/tutor/search"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-type": "application/json;encoding=utf-8",
      },
      body: json.encode(args),
    );

    if (response.statusCode == 200) {
      final jsonRes = json.decode(response.body);
      final List<dynamic> tutors = jsonRes["rows"];
      return tutors.map((tutor) => Tutor.fromJson(tutor)).toList();
    } else {
      final jsonRes = json.decode(response.body);
      throw Exception(jsonRes["message"]);
    }
  }

  // static method get tutor by id
  static Future<TutorDetailInfo> getTutorById(String id, String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/tutor/$id'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final jsonDecode = json.decode(response.body);
      return TutorDetailInfo.fromJson(jsonDecode);
    } else {
      final jsonDecode = json.decode(response.body);
      throw Exception(jsonDecode['message']);
    }
  }
}
