// To parse this JSON data, do
//
//     final dataModeHostingler = dataModeHostinglerFromJson(jsonString);

import 'dart:convert';

DataModelHostingler dataModeHostinglerFromJson(String str) => DataModelHostingler.fromJson(json.decode(str));

String dataModeHostinglerToJson(DataModelHostingler data) => json.encode(data.toJson());

class DataModelHostingler {
  DataModelHostingler({
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

  factory DataModelHostingler.fromJson(Map<String, dynamic> json) => DataModelHostingler(
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
    domainAdi: json["DomainAdi"] == null ? null : json["DomainAdi"],
    hostingFirmasi: json["HostingFirmasi"] == null ? null : json["HostingFirmasi"],
    platform: json["Platform"] == null ? null : json["Platform"],
    bitisTarihi: json["BitisTarihi"],
    kalanSure: json["KalanSure"],
    ssl: json["SSL"] == null ? null : json["SSL"],
    sslBitisTarihi: json["SSLBitisTarihi"] == null ? null : json["SSLBitisTarihi"],
    durum: json["Durum"] == null ? null : json["Durum"],
    trash: json["trash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "DomainAdi": domainAdi == null ? null : domainAdi,
    "HostingFirmasi": hostingFirmasi == null ? null : hostingFirmasi,
    "Platform": platform == null ? null : platform,
    "BitisTarihi": bitisTarihi,
    "KalanSure": kalanSure,
    "SSL": ssl == null ? null : ssl,
    "SSLBitisTarihi": sslBitisTarihi == null ? null : sslBitisTarihi,
    "Durum": durum == null ? null : durum,
    "trash": trash,
  };
}
