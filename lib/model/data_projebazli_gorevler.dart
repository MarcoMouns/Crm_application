// To parse this JSON data, do
//
//     final dataModelProjeBazliDemoLinkleri = dataModelProjeBazliDemoLinkleriFromJson(jsonString);

import 'dart:convert';

class DataModelProjeBazliGorevler {
  DataModelProjeBazliGorevler({
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

  factory DataModelProjeBazliGorevler.fromRawJson(String str) => DataModelProjeBazliGorevler.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataModelProjeBazliGorevler.fromJson(Map<String, dynamic> json) => DataModelProjeBazliGorevler(
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
    this.gorev,
    this.puan,
    this.gorevTarihi,
    this.gorevEkleyen,
    this.gorevSorumlusu,
    this.gorevSorumlusuName,
    this.projeId,
    this.projeAdi,
    this.durum,
    this.durumDate,
    this.urgent,
    this.trash,
  });

  String id;
  String gorev;
  dynamic puan;
  String gorevTarihi;
  String gorevEkleyen;
  String gorevSorumlusu;
  String gorevSorumlusuName;
  String projeId;
  String projeAdi;
  String durum;
  dynamic durumDate;
  String urgent;
  String trash;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    gorev: json["Gorev"],
    puan: json["Puan"],
    gorevTarihi: json["GorevTarihi"],
    gorevEkleyen: json["GorevEkleyen"],
    gorevSorumlusu: json["GorevSorumlusu"],
    gorevSorumlusuName: json["GorevSorumlusuName"],
    projeId: json["ProjeId"],
    projeAdi: json["ProjeAdi"],
    durum: json["Durum"],
    durumDate: json["DurumDate"],
    urgent: json["Urgent"],
    trash: json["trash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Gorev": gorev,
    "Puan": puan,
    "GorevTarihi": gorevTarihi,
    "GorevEkleyen": gorevEkleyen,
    "GorevSorumlusu": gorevSorumlusu,
    "GorevSorumlusuName": gorevSorumlusuName,
    "ProjeId": projeId,
    "ProjeAdi": projeAdi,
    "Durum": durum,
    "DurumDate": durumDate,
    "Urgent": urgent,
    "trash": trash,
  };
}
