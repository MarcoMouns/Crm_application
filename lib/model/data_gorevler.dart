class DataModelGorevler {
  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Data> data;
  List<String> input;

  DataModelGorevler(
      {this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      this.input});

  DataModelGorevler.fromJson(Map<String, dynamic> json) {
    draw = json['draw'];
    recordsTotal = json['recordsTotal'];
    recordsFiltered = json['recordsFiltered'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    input = json['input'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['draw'] = this.draw;
    data['recordsTotal'] = this.recordsTotal;
    data['recordsFiltered'] = this.recordsFiltered;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['input'] = this.input;
    return data;
  }
}

class Data {
  String id;
  String gorev;
  String puan;
  String gorevTarihi;
  String gorevEkleyen;
  String gorevSorumlusu;
  String gorevSorumlusuName;
  String projeId;
  String projeAdi;
  String durum;
  Null durumDate;
  String urgent;
  String trash;

  Data(
      {this.id,
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
      this.trash});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gorev = json['Gorev'];
    puan = json['Puan'];
    gorevTarihi = json['GorevTarihi'];
    gorevEkleyen = json['GorevEkleyen'];
    gorevSorumlusu = json['GorevSorumlusu'];
    gorevSorumlusuName = json['GorevSorumlusuName'];
    projeId = json['ProjeId'];
    projeAdi = json['ProjeAdi'];
    durum = json['Durum'];
    durumDate = json['DurumDate'];
    urgent = json['Urgent'];
    trash = json['trash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Gorev'] = this.gorev;
    data['Puan'] = this.puan;
    data['GorevTarihi'] = this.gorevTarihi;
    data['GorevEkleyen'] = this.gorevEkleyen;
    data['GorevSorumlusu'] = this.gorevSorumlusu;
    data['GorevSorumlusuName'] = this.gorevSorumlusuName;
    data['ProjeId'] = this.projeId;
    data['ProjeAdi'] = this.projeAdi;
    data['Durum'] = this.durum;
    data['DurumDate'] = this.durumDate;
    data['Urgent'] = this.urgent;
    data['trash'] = this.trash;
    return data;
  }
}
