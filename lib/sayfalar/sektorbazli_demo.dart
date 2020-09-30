import 'package:Crm_application/model/data_sektorbazli_demo.dart';
import 'package:Crm_application/services/service_sektorbazli_demo.dart';
import 'package:flutter/material.dart';

class SektorBazliDemo extends StatefulWidget {
  SektorBazliDemo({Key key}) : super(key: key);

  @override
  _SektorBazliDemoState createState() => _SektorBazliDemoState();
}

class _SektorBazliDemoState extends State<SektorBazliDemo> {
  ServiceSektorBazliDemoLinkleri apiManager = ServiceSektorBazliDemoLinkleri();
  Future<DataModelSektorBazliDemoLinkleri> _future;

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
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Sektöre Bazlı Demo"),
      ),
      body: _futureSektorBazliDemo(context),
    );
  }

  _futureSektorBazliDemo(BuildContext context) {
    return FutureBuilder<DataModelSektorBazliDemoLinkleri>(
        future: _future,
        builder: (context,
            AsyncSnapshot<DataModelSektorBazliDemoLinkleri> snapshot) {
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
                        subtitle: Text(_data.sektorId),
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
