import 'package:Crm_application/model/data_hostingler.dart';
import 'package:Crm_application/services/service_hostingler.dart';
import 'package:flutter/material.dart';

class Hostingler extends StatefulWidget {
  Hostingler({Key key}) : super(key: key);

  @override
  _HostinglerState createState() => _HostinglerState();
}

class _HostinglerState extends State<Hostingler> {
  ServiceHostingler apiManager = ServiceHostingler();
  Future<DataModelHostingler> _future;

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
        title: Text("Hostingler"),
      ),
      body: _futureHostingler(context),
    );
  }

  _futureHostingler(BuildContext context) {
    return FutureBuilder<DataModelHostingler>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModelHostingler> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final _data = snapshot.data.data[index];
                  return Card(
                    child: ListTile(
                      title: Text(_data.domainAdi ?? "null"),
                      subtitle: Text(_data.bitisTarihi ?? "null"),
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
