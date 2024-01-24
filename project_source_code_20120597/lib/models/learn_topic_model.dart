// ignore_for_file: public_member_api_docs, sort_constructors_first
class LearnTopic {
  late int id;
  late String key;
  late String name;

  LearnTopic({
    required this.id,
    required this.key,
    required this.name,
  });

  // fromJson and toJson method
  LearnTopic.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        key = json['key'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['name'] = name;
    return data;
  }
}
