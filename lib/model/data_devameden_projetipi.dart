class DataModelDevamEdenProjeTipi {
  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Data> data;
  List<dynamic> input;

  DataModelDevamEdenProjeTipi(
      {this.draw,
        this.recordsTotal,
        this.recordsFiltered,
        this.data,
        this.input});

  DataModelDevamEdenProjeTipi.fromJson(Map<String, dynamic> json) {
    draw = json['draw'];
    recordsTotal = json['recordsTotal'];
    recordsFiltered = json['recordsFiltered'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    input = json['input'].cast<dynamic>();
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
  String projeAdi;
  String projeSorumlusu;
  String baslangicTarihi;
  String status;
  String durum;
  String confirm;
  String trash;

  Data(
      {this.id,
        this.projeAdi,
        this.projeSorumlusu,
        this.baslangicTarihi,
        this.status,
        this.durum,
        this.confirm,
        this.trash});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projeAdi = json['ProjeAdi'];
    projeSorumlusu = json['ProjeSorumlusu'];
    baslangicTarihi = json['BaslangicTarihi'];
    status = json['Status'];
    durum = json['Durum'];
    confirm = json['confirm'];
    trash = json['trash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ProjeAdi'] = this.projeAdi;
    data['ProjeSorumlusu'] = this.projeSorumlusu;
    data['BaslangicTarihi'] = this.baslangicTarihi;
    data['Status'] = this.status;
    data['Durum'] = this.durum;
    data['confirm'] = this.confirm;
    data['trash'] = this.trash;
    return data;
  }
}