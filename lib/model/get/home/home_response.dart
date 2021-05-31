/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

class HomeResponse {
  int? userId;
  int? id;
  String? title;
  String? body;

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
}
