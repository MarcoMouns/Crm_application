import 'package:Crm_application/model/data_hosting.dart';
import 'package:Crm_application/services/service_hosting.dart';
import 'package:flutter/material.dart';

class HostingSureleri extends StatefulWidget {
  @override
  _HostingSureleriState createState() => _HostingSureleriState();
}

class _HostingSureleriState extends State<HostingSureleri> {
  ServiceHostingSuresi apiManager = ServiceHostingSuresi();
  Future<DataModeHostingSuresi> _future;

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
        title: Text("Hostin Bitme Süreleri(30 GÜN)"),
      ),
      body: _futureHostingSureleri(context),
    );
  }

  _futureHostingSureleri(BuildContext context) {
    return FutureBuilder<DataModeHostingSuresi>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModeHostingSuresi> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (context, index) {
                  final _data = snapshot.data.data[index];
                  return ListTile(
                    title: Text(_data.hostingFirmasi),
                    subtitle: Text(_data.domainAdi),
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
