/*
 * @Autor: LAKHANI KAMLESH
 * @Date:

 * @LastEditors: LAKHANI KAMLESH
 * @LastEditTime:
 */

import 'dart:convert';

ResultEntity resultFromJson(String str) =>
    ResultEntity.fromJson(json.decode(str));

String resultToJson(ResultEntity data) => json.encode(data.toJson());

class ResultEntity<T> {
  final String? code;
  final String? msg;
  final T? data;

  ResultEntity({this.code, this.msg, this.data});

  factory ResultEntity.fromJson(Map<String, dynamic> json) => ResultEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {"code": code, "message": msg, "data": data};
}
