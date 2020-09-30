import 'package:Crm_application/model/data_onaylanmayan_musteriler.dart';
import 'package:Crm_application/services/service_onaylanmayan_musteriler.dart';
import 'package:flutter/material.dart';

class OnaylanmayanMusteriler extends StatefulWidget {
  OnaylanmayanMusteriler({Key key}) : super(key: key);

  @override
  _OnaylanmayanMusterilerState createState() => _OnaylanmayanMusterilerState();
}

class _OnaylanmayanMusterilerState extends State<OnaylanmayanMusteriler> {
  final ServiceOnaylanmayanMusteriler apiManager = ServiceOnaylanmayanMusteriler();
  Future<DataModelOnaylanmayanMusteriler> _future;

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
        title: Text("Onaylanamayan Müşteriler"),
      ),
      body: _futureOnaylanmayanMusteri(context),
    );
  }

  _futureOnaylanmayanMusteri(BuildContext context) {
    return FutureBuilder<DataModelOnaylanmayanMusteriler>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModelOnaylanmayanMusteriler> snapshot) {
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
                        title: Text(_data.firmaAdi),
                        subtitle: Text(_data.yetkiliKisi),
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
