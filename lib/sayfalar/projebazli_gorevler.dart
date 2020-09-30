
import 'package:Crm_application/model/data_projebazli_gorevler.dart';
import 'package:Crm_application/services/service_projebazli_gorevler.dart';
import 'package:flutter/material.dart';

class ProjeBazliGorevler extends StatefulWidget {
  ProjeBazliGorevler({Key key}) : super(key: key);

  @override
  _ProjeBazliGorevlerState createState() => _ProjeBazliGorevlerState();
}

class _ProjeBazliGorevlerState extends State<ProjeBazliGorevler> {
  ServiceProjeBazliGorev apiManager = ServiceProjeBazliGorev();
  Future<DataModelProjeBazliGorevler> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = apiManager.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proje Bazlı Görevler"),
      ),
      body: _futureProjeBazliGorevler(context),
    );
  }

  _futureProjeBazliGorevler(BuildContext context) {
    return FutureBuilder<DataModelProjeBazliGorevler>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModelProjeBazliGorevler> snapshot) {
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
                        title: Text(_data.gorevEkleyen),
                        subtitle: Text(_data.gorevSorumlusu),
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
