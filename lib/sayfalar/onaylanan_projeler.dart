
import 'package:Crm_application/model/data_onaylanan_projeler.dart';

import 'package:Crm_application/services/service_onaylanan_projeler.dart';
import 'package:flutter/material.dart';

class OnaylananProjeler extends StatefulWidget {
  OnaylananProjeler({Key key}) : super(key: key);

  @override
  _OnaylananProjelerState createState() => _OnaylananProjelerState();
}

class _OnaylananProjelerState extends State<OnaylananProjeler> {
  final ServiceOnaylananProjeler apiManager = ServiceOnaylananProjeler();
  Future<DataModelOnaylananProjeler> _future;

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
        title: Text("Onaylanan Projeler"),
      ),
      body: _futureOnaylananProjeler(context),
    );
  }

  _futureOnaylananProjeler(BuildContext context) {
    return FutureBuilder<DataModelOnaylananProjeler>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModelOnaylananProjeler> snapshot) {
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
                        title: Text(_data.projeAdi),
                        subtitle: Text(_data.baslangicTarihi),
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
