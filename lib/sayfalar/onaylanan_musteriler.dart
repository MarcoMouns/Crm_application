import 'package:Crm_application/model/data_onaylanan_musteriler.dart';
import 'package:Crm_application/services/service_onaylanan_musteriler.dart';
import 'package:flutter/material.dart';

class OnaylananMusteri extends StatefulWidget {
  OnaylananMusteri({Key key}) : super(key: key);

  @override
  _OnaylananMusteriState createState() => _OnaylananMusteriState();
}

class _OnaylananMusteriState extends State<OnaylananMusteri> {
  final ServiceOnaylananMusteriler apiManager = ServiceOnaylananMusteriler();
  Future<DataModelOnaylananMusteriler> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = apiManager.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: Text("Onaylanan Müşteriler"),
      ),
      body: _futureMusteri(context),
    );
  }

  _futureMusteri(BuildContext context) {
    return FutureBuilder<DataModelOnaylananMusteriler>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModelOnaylananMusteriler> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.data.length,
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final _data = snapshot.data.data[index];
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      child: ListTile(
                        title: Text(_data.yetkiliKisi),
                        subtitle: Text(_data.firmaAdi),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
