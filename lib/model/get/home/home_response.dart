/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'package:equatable/equatable.dart';

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
