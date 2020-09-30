import 'package:Crm_application/model/data_onaylanmayan_projeler.dart';

import 'package:Crm_application/services/service_onaylanmayan_projeler.dart';
import 'package:flutter/material.dart';

class OnaylanmayanProjeler extends StatefulWidget {
  OnaylanmayanProjeler({Key key}) : super(key: key);

  @override
  _OnaylanmayanProjelerState createState() => _OnaylanmayanProjelerState();
}

class _OnaylanmayanProjelerState extends State<OnaylanmayanProjeler> {
  ServiceOnaylanmayanProjeler apiManager = ServiceOnaylanmayanProjeler();
  Future<DataModelOnaylanmayanProjeler> _future;

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
        title: Text("Onaylanmayan Projeler"),
      ),
      body: _futureOnaylanmayanPorjeler(context),
    );
  }

  _futureOnaylanmayanPorjeler(BuildContext context) {
    return FutureBuilder<DataModelOnaylanmayanProjeler>(
        future: _future,
        builder:
        (context, AsyncSnapshot<DataModelOnaylanmayanProjeler> snapshot) {
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
                      //                      title: Text(_data.),
                      //                      subtitle: Text(_data.platform),
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
