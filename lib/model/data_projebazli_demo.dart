// To parse this JSON data, do
//
//     final dataModelProjeBazliDemoLinkleri = dataModelProjeBazliDemoLinkleriFromJson(jsonString);

import 'dart:convert';

class DataModelProjeBazliDemoLinkleri {
  DataModelProjeBazliDemoLinkleri({
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

  factory DataModelProjeBazliDemoLinkleri.fromRawJson(String str) => DataModelProjeBazliDemoLinkleri.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataModelProjeBazliDemoLinkleri.fromJson(Map<String, dynamic> json) => DataModelProjeBazliDemoLinkleri(
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
    this.projeId,
    this.durum,
    this.toplam,
    this.check,
    this.trash,
  });

  String id;
  String demoUrl;
  String tarih;
  String demoUserId;
  String projeId;
  String durum;
  int toplam;
  int check;
  String trash;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    demoUrl: json["DemoUrl"],
    tarih: json["Tarih"],
    demoUserId: json["DemoUserId"],
    projeId: json["ProjeId"],
    durum: json["Durum"],
    toplam: json["Toplam"],
    check: json["Check"],
    trash: json["trash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "DemoUrl": demoUrl,
    "Tarih": tarih,
    "DemoUserId": demoUserId,
    "ProjeId": projeId,
    "Durum": durum,
    "Toplam": toplam,
    "Check": check,
    "trash": trash,
  };
}
