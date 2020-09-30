
import 'package:Crm_application/model/data_projebazli_demo.dart';
import 'package:Crm_application/services/service_projebazli_demo.dart';
import 'package:flutter/material.dart';

class ProjeBazliDemo extends StatefulWidget {
  ProjeBazliDemo({Key key}) : super(key: key);

  @override
  _ProjeBazliDemoState createState() => _ProjeBazliDemoState();
}

class _ProjeBazliDemoState extends State<ProjeBazliDemo> {
  ServiceProjeBazliDemoLinkleri apiManager = ServiceProjeBazliDemoLinkleri();
  Future<DataModelProjeBazliDemoLinkleri> _future;

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
        title: Text("Proje Bazlı Demo"),
      ),
      body: _futureProjeBazliDemo(context),
    );
  }

  _futureProjeBazliDemo(BuildContext context) {
    return FutureBuilder<DataModelProjeBazliDemoLinkleri>(future: _future,
        builder: (context, AsyncSnapshot<DataModelProjeBazliDemoLinkleri> snapshot) {
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
                        title: Text(_data.demoUrl),
                        subtitle: Text(_data.projeId),
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
