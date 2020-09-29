// To parse this JSON data, do
//
//     final dataModelOnaylanmayanMusteriler = dataModelOnaylanmayanMusterilerFromJson(jsonString);

import 'dart:convert';

class DataModelOnaylanmayanMusteriler {
  DataModelOnaylanmayanMusteriler({
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

  factory DataModelOnaylanmayanMusteriler.fromRawJson(String str) => DataModelOnaylanmayanMusteriler.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataModelOnaylanmayanMusteriler.fromJson(Map<String, dynamic> json) => DataModelOnaylanmayanMusteriler(
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
    this.firmaAdi,
    this.sektor,
    this.telefon,
    this.yetkiliKisi,
    this.yetkiliTelefon,
    this.trash,
  });

  String id;
  String firmaAdi;
  String sektor;
  String telefon;
  String yetkiliKisi;
  String yetkiliTelefon;
  String trash;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    firmaAdi: json["FirmaAdi"],
    sektor: json["Sektor"],
    telefon: json["Telefon"] == null ? null : json["Telefon"],
    yetkiliKisi: json["YetkiliKisi"] == null ? null : json["YetkiliKisi"],
    yetkiliTelefon: json["YetkiliTelefon"] == null ? null : json["YetkiliTelefon"],
    trash: json["trash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "FirmaAdi": firmaAdi,
    "Sektor": sektor,
    "Telefon": telefon == null ? null : telefon,
    "YetkiliKisi": yetkiliKisi == null ? null : yetkiliKisi,
    "YetkiliTelefon": yetkiliTelefon == null ? null : yetkiliTelefon,
    "trash": trash,
  };
}
