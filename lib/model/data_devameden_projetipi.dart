// To parse this JSON data, do
//
//     final dataModelDevamedenProjeTipi = dataModelDevamedenProjeTipiFromJson(jsonString);

import 'dart:convert';

DataModelDevamedenProjeTipi dataModelDevamedenProjeTipiFromJson(String str) => DataModelDevamedenProjeTipi.fromJson(json.decode(str));

String dataModelDevamedenProjeTipiToJson(DataModelDevamedenProjeTipi data) => json.encode(data.toJson());

class DataModelDevamedenProjeTipi {
  DataModelDevamedenProjeTipi({
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

  factory DataModelDevamedenProjeTipi.fromJson(Map<String, dynamic> json) => DataModelDevamedenProjeTipi(
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

enum ProjeSorumlusu { BURAK_EMUCE, ILKER_TIRYAKIOLU, UFUK_EN, IREM_ERDOAN }

final projeSorumlusuValues = EnumValues({
  "Burak Emuce": ProjeSorumlusu.BURAK_EMUCE,
  "Ilker Tiryakioğlu": ProjeSorumlusu.ILKER_TIRYAKIOLU,
  "Irem Erdoğan": ProjeSorumlusu.IREM_ERDOAN,
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
