// To parse this JSON data, do
//
//     final dataModelSektorBazliDemoLinkerl = dataModelSektorBazliDemoLinkerlFromJson(jsonString);

import 'dart:convert';

class DataModelSektorBazliDemoLinkerl {
  DataModelSektorBazliDemoLinkerl({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
    this.input,
  });

  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Datum> data;
  List<dynamic> input;

  factory DataModelSektorBazliDemoLinkerl.fromRawJson(String str) => DataModelSektorBazliDemoLinkerl.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataModelSektorBazliDemoLinkerl.fromJson(Map<String, dynamic> json) => DataModelSektorBazliDemoLinkerl(
    draw: json["draw"],
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    input: List<dynamic>.from(json["input"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "input": List<dynamic>.from(input.map((x) => x)),
  };
}

class Datum {
  Datum({
    this.id,
    this.demoUrl,
    this.tarih,
    this.demoUserId,
    this.sektorId,
    this.trash,
  });

  String id;
  String demoUrl;
  String tarih;
  String demoUserId;
  String sektorId;
  String trash;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    demoUrl: json["DemoUrl"],
    tarih: json["Tarih"],
    demoUserId: json["DemoUserId"],
    sektorId: json["SektorId"],
    trash: json["trash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "DemoUrl": demoUrl,
    "Tarih": tarih,
    "DemoUserId": demoUserId,
    "SektorId": sektorId,
    "trash": trash,
  };
}
