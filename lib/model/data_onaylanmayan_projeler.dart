// To parse this JSON data, do
//
//     final dataModelOnaylanmayanProjeler = dataModelOnaylanmayanProjelerFromJson(jsonString);

import 'dart:convert';

class DataModelOnaylanmayanProjeler {
  DataModelOnaylanmayanProjeler({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
    this.input,
  });

  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<dynamic> data;
  List<dynamic> input;

  factory DataModelOnaylanmayanProjeler.fromRawJson(String str) => DataModelOnaylanmayanProjeler.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataModelOnaylanmayanProjeler.fromJson(Map<String, dynamic> json) => DataModelOnaylanmayanProjeler(
    draw: json["draw"],
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
    input: List<dynamic>.from(json["input"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x)),
    "input": List<dynamic>.from(input.map((x) => x)),
  };
}
