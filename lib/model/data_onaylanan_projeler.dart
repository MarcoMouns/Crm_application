// To parse this JSON data, do
//
//     final dataModelOnaylananProjeler = dataModelOnaylananProjelerFromJson(jsonString);

import 'dart:convert';

class DataModelOnaylananProjeler {
  DataModelOnaylananProjeler({
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

  factory DataModelOnaylananProjeler.fromRawJson(String str) =>
      DataModelOnaylananProjeler.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataModelOnaylananProjeler.fromJson(Map<String, dynamic> json) =>
      DataModelOnaylananProjeler(
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
    this.projeAdi,
    this.projeSorumlusu,
    this.baslangicTarihi,
    this.status,
    this.durum,
    this.confirm,
    this.trash,
  });

  String id;
  String projeAdi;
  ProjeSorumlusu projeSorumlusu;
  String baslangicTarihi;
  String status;
  String durum;
  String confirm;
  String trash;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        projeAdi: json["ProjeAdi"],
        projeSorumlusu: projeSorumlusuValues.map[json["ProjeSorumlusu"]],
        baslangicTarihi: json["BaslangicTarihi"],
        status: json["Status"] == null ? null : json["Status"],
        durum: json["Durum"],
        confirm: json["confirm"],
        trash: json["trash"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ProjeAdi": projeAdi,
        "ProjeSorumlusu": projeSorumlusuValues.reverse[projeSorumlusu],
        "BaslangicTarihi": baslangicTarihi,
        "Status": status == null ? null : status,
        "Durum": durum,
        "confirm": confirm,
        "trash": trash,
      };
}

enum ProjeSorumlusu {
  IREM_ERDOAN,
  BURAK_EMUCE,
  ILKER_TIRYAKIOLU,
  BURAK_NASR,
  UFUK_EN,
  EMPTY,
  KULLANC
}

final projeSorumlusuValues = EnumValues({
  "Burak Emuce": ProjeSorumlusu.BURAK_EMUCE,
  "Burak Nasır": ProjeSorumlusu.BURAK_NASR,
  "": ProjeSorumlusu.EMPTY,
  "Ilker Tiryakioğlu": ProjeSorumlusu.ILKER_TIRYAKIOLU,
  "Irem Erdoğan": ProjeSorumlusu.IREM_ERDOAN,
  "kullanıcı": ProjeSorumlusu.KULLANC,
  "Ufuk Şen": ProjeSorumlusu.UFUK_EN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
