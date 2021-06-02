/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<HomeResponse> homeResponseWithoutDecode(dynamic str) =>
    List<HomeResponse>.from(str.map((x) => HomeResponse.fromJson(x)));

List<HomeResponse> homeResponseFromDecode(String str) =>
    List<HomeResponse>.from(json.decode(str).map((x) => HomeResponse.fromJson(x)));

String homeResponseToJson(List<HomeResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeResponse  extends Equatable{
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  HomeResponse({this.userId, this.id, this.title, this.body});

  factory HomeResponse.fromJson(Map<String, dynamic>? json) {
    if (json != null)
      return (HomeResponse(
          userId: json['userId'] ?? 0,
          id: json['id'] ?? '',
          title: json['title'] ?? '',
          body: json['body'] ?? ''));
    return HomeResponse();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userId, id, body, title];

  int? get getUserId => userId;
  int? get getId => id;
  String? get getBody => body;
  String? get getTitle => title;
}
