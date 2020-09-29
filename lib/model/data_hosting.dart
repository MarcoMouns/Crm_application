// To parse this JSON data, do
//
//     final dataModeHostingSuresi = dataModeHostingSuresiFromJson(jsonString);

import 'dart:convert';

DataModeHostingSuresi dataModeHostingSuresiFromJson(String str) => DataModeHostingSuresi.fromJson(json.decode(str));

String dataModeHostingSuresiToJson(DataModeHostingSuresi data) => json.encode(data.toJson());

class DataModeHostingSuresi {
  DataModeHostingSuresi({
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

  factory DataModeHostingSuresi.fromJson(Map<String, dynamic> json) => DataModeHostingSuresi(
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
    this.domainAdi,
    this.hostingFirmasi,
    this.platform,
    this.bitisTarihi,
    this.kalanSure,
    this.ssl,
    this.sslBitisTarihi,
    this.durum,
    this.trash,
  });

  String id;
  String domainAdi;
  String hostingFirmasi;
  String platform;
  String bitisTarihi;
  String kalanSure;
  String ssl;
  String sslBitisTarihi;
  String durum;
  String trash;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    domainAdi: json["DomainAdi"],
    hostingFirmasi: json["HostingFirmasi"],
    platform: json["Platform"],
    bitisTarihi: json["BitisTarihi"],
    kalanSure: json["KalanSure"],
    ssl: json["SSL"] == null ? null : json["SSL"],
    sslBitisTarihi: json["SSLBitisTarihi"] == null ? null : json["SSLBitisTarihi"],
    durum: json["Durum"],
    trash: json["trash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "DomainAdi": domainAdi,
    "HostingFirmasi": hostingFirmasi,
    "Platform": platform,
    "BitisTarihi": bitisTarihi,
    "KalanSure": kalanSure,
    "SSL": ssl == null ? null : ssl,
    "SSLBitisTarihi": sslBitisTarihi == null ? null : sslBitisTarihi,
    "Durum": durum,
    "trash": trash,
  };
}
