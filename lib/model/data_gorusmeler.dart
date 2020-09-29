// To parse this JSON data, do
//
//     final dataModelGorusmeler = dataModelGorusmelerFromJson(jsonString);

import 'dart:convert';

DataModelGorusmeler dataModelGorusmelerFromJson(String str) => DataModelGorusmeler.fromJson(json.decode(str));

String dataModelGorusmelerToJson(DataModelGorusmeler data) => json.encode(data.toJson());

class DataModelGorusmeler {
  DataModelGorusmeler({
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

  factory DataModelGorusmeler.fromJson(Map<String, dynamic> json) => DataModelGorusmeler(
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
    this.hizmet,
    this.musteriId,
    this.musteri,
    this.personel,
    this.kayitTarihi,
    this.durum,
    this.sonuc,
    this.trash,
  });

  String id;
  String hizmet;
  String musteriId;
  String musteri;
  Personel personel;
  String kayitTarihi;
  String durum;
  Sonuc sonuc;
  String trash;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    hizmet: json["Hizmet"] == null ? null : json["Hizmet"],
    musteriId: json["MusteriId"],
    musteri: json["Musteri"],
    personel: personelValues.map[json["Personel"]],
    kayitTarihi: json["KayitTarihi"],
    durum: json["Durum"],
    sonuc: sonucValues.map[json["Sonuc"]],
    trash: json["trash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Hizmet": hizmet == null ? null : hizmet,
    "MusteriId": musteriId,
    "Musteri": musteri,
    "Personel": personelValues.reverse[personel],
    "KayitTarihi": kayitTarihi,
    "Durum": durum,
    "Sonuc": sonucValues.reverse[sonuc],
    "trash": trash,
  };
}

enum Personel { IREM_ERDOAN, ILKER_TIRYAKIOLU, UFUK_EN, EMPTY }

final personelValues = EnumValues({
  "": Personel.EMPTY,
  "Ilker Tiryakioğlu": Personel.ILKER_TIRYAKIOLU,
  "Irem Erdoğan": Personel.IREM_ERDOAN,
  "Ufuk Şen": Personel.UFUK_EN
});

enum Sonuc { SAT_PTAL, TEKLIF_VERILDI, SAT_GEREKLETI, TEKLIF_VERILECEK, SAT_KAYDEDILDI, SAT_ERTELENDI }

final sonucValues = EnumValues({
  "Satış Ertelendi": Sonuc.SAT_ERTELENDI,
  "Satış Gerçekleşti": Sonuc.SAT_GEREKLETI,
  "Satış Kaydedildi": Sonuc.SAT_KAYDEDILDI,
  "Satış İptal": Sonuc.SAT_PTAL,
  "Teklif Verildi": Sonuc.TEKLIF_VERILDI,
  "Teklif Verilecek": Sonuc.TEKLIF_VERILECEK
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
