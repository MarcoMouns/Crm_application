import 'package:Crm_application/model/data_tamamlanan_projetipi.dart';
import 'package:Crm_application/services/service_tamamlanan_projetipi.dart';
import 'package:flutter/material.dart';

class TamamlananProjeTipi extends StatefulWidget {
  TamamlananProjeTipi({Key key}) : super(key: key);

  @override
  _TamamlananProjeTipiState createState() => _TamamlananProjeTipiState();
}

class _TamamlananProjeTipiState extends State<TamamlananProjeTipi> {
  ServiceTamamlananProjeTipi apiManager = ServiceTamamlananProjeTipi();
  Future<DataModelTamamlananProjeTipi> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = apiManager.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("Tamamlanan Projeler"),
      ),
      body: _futureTamamlananProjeTipi(context),
    );
  }

  _futureTamamlananProjeTipi(BuildContext context) {
    return FutureBuilder<DataModelTamamlananProjeTipi>(
        future: _future,
        builder:
            (context, AsyncSnapshot<DataModelTamamlananProjeTipi> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final _data = snapshot.data.data[index];
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      child: ListTile(
                        title: Text(_data.projeSorumlusu),
                        subtitle: Text(_data.projeAdi),
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
