// To parse this JSON data, do
//
//     final sektorlerModel = sektorlerModelFromJson(jsonString);

import 'dart:convert';

List<SektorlerModel> sektorlerModelFromJson(String str) => List<SektorlerModel>.from(json.decode(str).map((x) => SektorlerModel.fromJson(x)));

String sektorlerModelToJson(List<SektorlerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SektorlerModel {
  
 String id;
  String name;
  String trash;

  SektorlerModel({
    this.id,
    this.name,
    this.trash,
  });

 

  factory SektorlerModel.fromJson(Map<String, dynamic> json) => SektorlerModel(
    id: json["id"],
    name: json["Name"],
    trash: json["trash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Name": name,
    "trash": trash,
  };
}
